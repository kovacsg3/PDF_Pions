all: gnuplot mpost pdf png install

gnuplot:
	gnuplot plotfile

mpost:
	bash ./convert.sh

pdf:
	epstopdf plot-0.eps
	pdftops -eps plot-0.pdf

png:
	pdftoppm -r 500 -png plot-0.pdf > plot-0.png

install:
	mv plot-0.pdf ../'pion-corr'.pdf

