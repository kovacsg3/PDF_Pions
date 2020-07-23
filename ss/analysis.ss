#!/usr/bin/env scheme-script

(import (cslib all))

(define results-tag
  (make-parameter #f))

(define results-path
  (make-parameter #f))

(define lmom-list
  (make-parameter #f))

(define tsep-list
  (make-parameter #f))

(define ainv
  (make-parameter #f))

(define dz-limit
  (make-parameter #f))

(define (get-results-paths)
  (scpath-sort
    "results="
    (filter
      (lambda (p)
        (and
          (file-exists? (filepath-append p "proton-corr"))
          (file-exists? (filepath-append p "pion-corr"))
          (file-exists? (filepath-append p "pion-qpdf-latio"))
          (file-exists? (filepath-append p "proton-u-qpdf-latio"))
          (file-exists? (filepath-append p "proton-d-qpdf-latio"))))
      (glob-expand-at (results-path) "results=*"))))

(define (get-jsamples-with load-sample)
  (let ([samples (map load-sample (get-results-paths))])
    (jackknife tree+ tree- tree* samples)))

(define (get-func-ve func jvals)
  (let ([vs (map func jvals)])
    (list (car vs) (apply tree-op jackknife-sigma vs))))

(define (get-corr-lmom path name lmom)
  (load-datatable (filepath-append path name (format "lmom=~a.txt" lmom))))

(define (get-corr path name)
  (cons name
        (map (lambda (lmom)
               (cons (list 'lmom lmom)
                     (get-corr-lmom path name lmom)))
             (lmom-list))))

(define (get-qpdf-lmom-tsep path name lmom tsep)
  (if (string=? "proton-u-d-qpdf-latio" name)
      (tree- (get-qpdf-lmom-tsep path "proton-u-qpdf-latio" lmom tsep)
             (get-qpdf-lmom-tsep path "proton-d-qpdf-latio" lmom tsep))
      (load-lat-data (filepath-append path name (format "lmom=~a ; tsep=~a.lat" lmom tsep)))))

(define (get-qpdf path name)
  (cons name
        (flip-map
          (lmom-list)
          (lambda (lmom)
            (cons
              (list 'lmom lmom)
              (flip-map
                (tsep-list)
                (lambda (tsep)
                  (cons
                    (list 'tsep tsep)
                    (get-qpdf-lmom-tsep path name lmom tsep)))))))))

(define (get-sample path)
  ; sample data structure
  ; (list
  ;   (list "pion-corr"
  ;     (list
  ;       (cons (list 'lmom lmom) datatable)
  ;       ...
  ;     )
  ;   )
  ;   (list "pion-qpdf-latio"
  ;     (list
  ;       (cons
  ;         (list 'lmom lmom)
  ;         (list
  ;           (cons (list 'tsep tsep) lat-data)
  ;           ...
  ;         ))
  ;       ...
  ;     )
  ;   )
  ;   ...
  ; )
  (list
    (get-corr path "pion-corr")
    (get-corr path "proton-corr")
    (get-qpdf path "pion-qpdf-latio")
    (get-qpdf path "proton-u-qpdf-latio")
    (get-qpdf path "proton-d-qpdf-latio")
    (get-qpdf path "proton-u-d-qpdf-latio")))

(define (get-gz/gt-ratio-name-lmom-tsep sample name lmom tsep)
  (let* ([top (/ tsep 2)]
         [dz 0]
         [dz-idx (+ dz (dz-limit))])
    (magnitude
      (/ (* ii
            (vector-head
              (lat-data-ref
                (rec-lookup sample name (list 'lmom lmom) (list 'tsep tsep))
                (vector 1 1 top dz-idx))))
         (vector-head
           (lat-data-ref
             (rec-lookup sample name (list 'lmom lmom) (list 'tsep tsep))
             (vector 1 0 top dz-idx)))))))

(define (get-gz/gt-ratio-name sample name)
  (cons name
        (map
          (lambda (lmom)
            (map
              (lambda (tsep)
                (get-gz/gt-ratio-name-lmom-tsep sample name lmom tsep))
              (tsep-list)))
          (lmom-list))))

(define (get-gz/gt-ratio sample)
  (list
    (get-gz/gt-ratio-name sample "pion-qpdf-latio")
    (get-gz/gt-ratio-name sample "proton-u-d-qpdf-latio")))

(define (get-corr-dt jsamples name lmom)
  (let ([f (lambda (s)
             (rec-lookup s name (list 'lmom lmom)))])
    (merge-same-idx-datatables
      (f (car jsamples))
      (apply tree-op jackknife-sigma
        (map f jsamples)))))

(define (plot-corr jsamples name)
  (plot-save
    (format "plots/~a/~a.pdf" (results-tag) name)
    (cons "corr-0.txt"
          (get-corr-dt jsamples name 0))
    (cons "corr-1.txt"
          (get-corr-dt jsamples name 1))
    (cons "corr-2.txt"
          (get-corr-dt jsamples name 2))
    (cons "corr-3.txt"
          (get-corr-dt jsamples name 3))
    (cons "corr-4.txt"
          (get-corr-dt jsamples name 4))
    (format "set title '~a'" name)
    "set key rm"
    "set logscale y"
    (mk-plot-line
      "plot [0:20]"
      "'corr-0.txt' u 1:2:4 w yerrorbar t '$P_z = 0$'"
      "'corr-1.txt' u 1:2:4 w yerrorbar t '$P_z = 1$'"
      "'corr-2.txt' u 1:2:4 w yerrorbar t '$P_z = 2$'"
      "'corr-3.txt' u 1:2:4 w yerrorbar t '$P_z = 3$'"
      "'corr-4.txt' u 1:2:4 w yerrorbar t '$P_z = 4$'"
      )))

(define (collect-analysis)
  (let* ([jsamples (get-jsamples-with get-sample)])
    (print (dec (length jsamples)))
    (plot-corr jsamples "pion-corr")
    (plot-corr jsamples "proton-corr")
    ; (print
    ;   (apply
    ;     tree-op cons
    ;     (get-func-ve get-gz/gt-ratio jsamples)))
    )
  )

(define (reset-param)
  (lmom-list
    (list 0 1 2 3 4))
  (tsep-list
    (list 4 6 8))
  )

(define (reset-param-24D)
  (reset-param)
  (results-tag "24D")
  (results-path "../collect-data/results/24D")
  (ainv 1.015)
  (dz-limit 12)
  )

(define (reset-param-48I)
  (reset-param)
  (results-tag "48I")
  (results-path "../collect-data/results/48I")
  (ainv 1.73)
  (dz-limit 24))

(print "hello")

(print (cd))

(fork-limit 4)

(fork-exec
  (reset-param-48I)
  (collect-analysis))

(fork-exec
  (reset-param-24D)
  (collect-analysis))

(wait-all)
