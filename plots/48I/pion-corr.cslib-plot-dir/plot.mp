%GNUPLOT Metapost output: Thu Jul 23 12:17:37 2020

prologues:=3;

%% Add \documentclass and \begin{dcoument} for latex
%% NB you should set the environment variable TEX to the name of your
%% latex executable (normally latex) inorder for metapost to work
%% or run
%% mpost --tex=latex ...

% BEGPRE
verbatimtex
\documentclass{article}
\usepackage[intlimits]{amsmath}
\usepackage{amsfonts}
\begin{document}
etex
% ENDPRE

warningcheck:=0;
defaultmpt:=mpt:=4;
th:=.6;
%% Have nice sharp joins on our lines
linecap:=butt;
linejoin:=mitered;

def scalepen expr n = pickup pencircle scaled (n*th) enddef;
def ptsize expr n = mpt:=n*defaultmpt enddef;


textmag:= 1.000;
vardef makepic(expr str) =
  if picture str : str scaled textmag
  % otherwise a string
  else: str infont defaultfont scaled (defaultscale*textmag)
  fi
enddef;

def infontsize(expr str, size) =
  infont str scaled (size / fontsize str)
enddef;

color currentcolor; currentcolor:=black;
picture currentdash; currentdash:=dashpattern(on 1);
color fillcolor;
boolean colorlines,dashedlines;
colorlines:=true;
dashedlines:=true;

def _wc = withpen currentpen withcolor currentcolor dashed currentdash enddef;
def _ac = addto currentpicture enddef;
def _sms = scaled mpt shifted enddef;
% drawing point-types
def gpdraw (expr n, x, y) =
  if n<0: _ac contour fullcircle _sms (x,y)
  elseif (n=1) or (n=3):
    _ac doublepath ptpath[n] _sms (x,y) _wc;
    _ac doublepath ptpath[n] rotated 90 _sms (x,y) _wc
  elseif n<6: _ac doublepath ptpath[n] _sms (x,y) _wc
  else: _ac contour ptpath[n] _sms (x,y) _wc
  fi
enddef;

% the point shapes
path ptpath[];
%diamond
ptpath0 = ptpath6 = (-1/2,0)--(0,-1/2)--(1/2,0)--(0,1/2)--cycle;
% plus sign
ptpath1 = (-1/2,0)--(1/2,0);
% square
ptpath2 = ptpath7 = (-1/2,-1/2)--(1/2,-1/2)--(1/2,1/2)--(-1/2,1/2)--cycle;
% cross
ptpath3 := (-1/2,-1/2)--(1/2,1/2);
% circle:
ptpath4 = ptpath8:= fullcircle;
% triangle
ptpath5 = ptpath9 := (0,1/2)--(-1/2,-1/2)--(1/2,-1/2)--cycle;

def linetype expr n =
  currentcolor:= if colorlines : col[n] else: black fi;
  currentdash:= if dashedlines : lt[n] else: dashpattern(on 1) fi;
  if n = -1 :
      drawoptions(withcolor currentcolor withpen (currentpen scaled .5));
  else :
    drawoptions(_wc);
  fi
enddef;

% dash patterns
picture lt[];
lt[-2]:=lt[-1]:=lt0:=dashpattern(on 1);
lt1=dashpattern(on 2 off 2); % dashes
lt2=dashpattern(on 2 off 2 on 0.2 off 2); %dash-dot
lt3=lt1 scaled 1.414;
lt4=lt2 scaled 1.414;
lt5=lt1 scaled 2;
lt6:=lt2 scaled 2;
lt7=dashpattern(on 0.2 off 2); %dots

color col[],cyan, magenta, yellow;
cyan=blue+green; magenta=red+blue;yellow=green+red;
col[-2]:=col[-1]:=col0:=black;
col1:=red;
col2:=(.2,.2,1); %blue
col3:=(1,.66,0); %orange
col4:=.85*green;
col5:=.9*magenta;
col6:=0.85*cyan;
col7:=.85*yellow;

%placing text
picture GPtext;
def put_text(expr pic, x, y, r, j) =
  GPtext:=makepic(pic);
  GPtext:=GPtext shifted
    if j = 1: (-(ulcorner GPtext + llcorner GPtext)/2)
    elseif j = 2: (-center GPtext)
    else: (-(urcorner GPtext + lrcorner GPtext)/2)
    fi
    rotated r;
  addto currentpicture also GPtext shifted (x,y)
enddef;

beginfig(0);
w:=5.000in;h:=3.000in;
a:=w/1200.0;b:=h/720.0;
scalepen 1; ptsize 1.000;linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,73.2b)--(237.8a,73.2b);
draw (917.8a,73.2b)--(901.2a,73.2b);
put_text( btex 0.00000001 etex, 203.5a, 73.2b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,100.1b)--(229.5a,100.1b);
draw (917.8a,100.1b)--(909.5a,100.1b);
draw (221.2a,115.9b)--(229.5a,115.9b);
draw (917.8a,115.9b)--(909.5a,115.9b);
draw (221.2a,127.1b)--(229.5a,127.1b);
draw (917.8a,127.1b)--(909.5a,127.1b);
draw (221.2a,135.7b)--(229.5a,135.7b);
draw (917.8a,135.7b)--(909.5a,135.7b);
draw (221.2a,142.8b)--(229.5a,142.8b);
draw (917.8a,142.8b)--(909.5a,142.8b);
draw (221.2a,148.8b)--(229.5a,148.8b);
draw (917.8a,148.8b)--(909.5a,148.8b);
draw (221.2a,154.0b)--(229.5a,154.0b);
draw (917.8a,154.0b)--(909.5a,154.0b);
draw (221.2a,158.6b)--(229.5a,158.6b);
draw (917.8a,158.6b)--(909.5a,158.6b);
draw (221.2a,162.7b)--(237.8a,162.7b);
draw (917.8a,162.7b)--(901.2a,162.7b);
put_text( btex 0.00000010 etex, 203.5a, 162.7b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,189.6b)--(229.5a,189.6b);
draw (917.8a,189.6b)--(909.5a,189.6b);
draw (221.2a,205.4b)--(229.5a,205.4b);
draw (917.8a,205.4b)--(909.5a,205.4b);
draw (221.2a,216.6b)--(229.5a,216.6b);
draw (917.8a,216.6b)--(909.5a,216.6b);
draw (221.2a,225.2b)--(229.5a,225.2b);
draw (917.8a,225.2b)--(909.5a,225.2b);
draw (221.2a,232.3b)--(229.5a,232.3b);
draw (917.8a,232.3b)--(909.5a,232.3b);
draw (221.2a,238.3b)--(229.5a,238.3b);
draw (917.8a,238.3b)--(909.5a,238.3b);
draw (221.2a,243.5b)--(229.5a,243.5b);
draw (917.8a,243.5b)--(909.5a,243.5b);
draw (221.2a,248.1b)--(229.5a,248.1b);
draw (917.8a,248.1b)--(909.5a,248.1b);
draw (221.2a,252.2b)--(237.8a,252.2b);
draw (917.8a,252.2b)--(901.2a,252.2b);
put_text( btex 0.00000100 etex, 203.5a, 252.2b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,279.1b)--(229.5a,279.1b);
draw (917.8a,279.1b)--(909.5a,279.1b);
draw (221.2a,294.9b)--(229.5a,294.9b);
draw (917.8a,294.9b)--(909.5a,294.9b);
draw (221.2a,306.0b)--(229.5a,306.0b);
draw (917.8a,306.0b)--(909.5a,306.0b);
draw (221.2a,314.7b)--(229.5a,314.7b);
draw (917.8a,314.7b)--(909.5a,314.7b);
draw (221.2a,321.8b)--(229.5a,321.8b);
draw (917.8a,321.8b)--(909.5a,321.8b);
draw (221.2a,327.8b)--(229.5a,327.8b);
draw (917.8a,327.8b)--(909.5a,327.8b);
draw (221.2a,333.0b)--(229.5a,333.0b);
draw (917.8a,333.0b)--(909.5a,333.0b);
draw (221.2a,337.6b)--(229.5a,337.6b);
draw (917.8a,337.6b)--(909.5a,337.6b);
draw (221.2a,341.7b)--(237.8a,341.7b);
draw (917.8a,341.7b)--(901.2a,341.7b);
put_text( btex 0.00001000 etex, 203.5a, 341.7b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,368.6b)--(229.5a,368.6b);
draw (917.8a,368.6b)--(909.5a,368.6b);
draw (221.2a,384.3b)--(229.5a,384.3b);
draw (917.8a,384.3b)--(909.5a,384.3b);
draw (221.2a,395.5b)--(229.5a,395.5b);
draw (917.8a,395.5b)--(909.5a,395.5b);
draw (221.2a,404.2b)--(229.5a,404.2b);
draw (917.8a,404.2b)--(909.5a,404.2b);
draw (221.2a,411.3b)--(229.5a,411.3b);
draw (917.8a,411.3b)--(909.5a,411.3b);
draw (221.2a,417.3b)--(229.5a,417.3b);
draw (917.8a,417.3b)--(909.5a,417.3b);
draw (221.2a,422.5b)--(229.5a,422.5b);
draw (917.8a,422.5b)--(909.5a,422.5b);
draw (221.2a,427.0b)--(229.5a,427.0b);
draw (917.8a,427.0b)--(909.5a,427.0b);
draw (221.2a,431.1b)--(237.8a,431.1b);
draw (917.8a,431.1b)--(901.2a,431.1b);
put_text( btex 0.00010000 etex, 203.5a, 431.1b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,458.1b)--(229.5a,458.1b);
draw (917.8a,458.1b)--(909.5a,458.1b);
draw (221.2a,473.8b)--(229.5a,473.8b);
draw (917.8a,473.8b)--(909.5a,473.8b);
draw (221.2a,485.0b)--(229.5a,485.0b);
draw (917.8a,485.0b)--(909.5a,485.0b);
draw (221.2a,493.7b)--(229.5a,493.7b);
draw (917.8a,493.7b)--(909.5a,493.7b);
draw (221.2a,500.8b)--(229.5a,500.8b);
draw (917.8a,500.8b)--(909.5a,500.8b);
draw (221.2a,506.8b)--(229.5a,506.8b);
draw (917.8a,506.8b)--(909.5a,506.8b);
draw (221.2a,511.9b)--(229.5a,511.9b);
draw (917.8a,511.9b)--(909.5a,511.9b);
draw (221.2a,516.5b)--(229.5a,516.5b);
draw (917.8a,516.5b)--(909.5a,516.5b);
draw (221.2a,520.6b)--(237.8a,520.6b);
draw (917.8a,520.6b)--(901.2a,520.6b);
put_text( btex 0.00100000 etex, 203.5a, 520.6b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,547.6b)--(229.5a,547.6b);
draw (917.8a,547.6b)--(909.5a,547.6b);
draw (221.2a,563.3b)--(229.5a,563.3b);
draw (917.8a,563.3b)--(909.5a,563.3b);
draw (221.2a,574.5b)--(229.5a,574.5b);
draw (917.8a,574.5b)--(909.5a,574.5b);
draw (221.2a,583.2b)--(229.5a,583.2b);
draw (917.8a,583.2b)--(909.5a,583.2b);
draw (221.2a,590.2b)--(229.5a,590.2b);
draw (917.8a,590.2b)--(909.5a,590.2b);
draw (221.2a,596.2b)--(229.5a,596.2b);
draw (917.8a,596.2b)--(909.5a,596.2b);
draw (221.2a,601.4b)--(229.5a,601.4b);
draw (917.8a,601.4b)--(909.5a,601.4b);
draw (221.2a,606.0b)--(229.5a,606.0b);
draw (917.8a,606.0b)--(909.5a,606.0b);
draw (221.2a,610.1b)--(237.8a,610.1b);
draw (917.8a,610.1b)--(901.2a,610.1b);
put_text( btex 0.01000000 etex, 203.5a, 610.1b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,73.2b)--(221.2a,89.8b);
draw (221.2a,610.1b)--(221.2a,593.5b);
put_text( btex $0$ etex, 221.2a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (395.4a,73.2b)--(395.4a,89.8b);
draw (395.4a,610.1b)--(395.4a,593.5b);
put_text( btex $5$ etex, 395.4a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (569.5a,73.2b)--(569.5a,89.8b);
draw (569.5a,610.1b)--(569.5a,593.5b);
put_text( btex $10$ etex, 569.5a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (743.7a,73.2b)--(743.7a,89.8b);
draw (743.7a,610.1b)--(743.7a,593.5b);
put_text( btex $15$ etex, 743.7a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (917.8a,73.2b)--(917.8a,89.8b);
draw (917.8a,610.1b)--(917.8a,593.5b);
put_text( btex $20$ etex, 917.8a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,610.1b)--(221.2a,73.2b)--(917.8a,73.2b)--(917.8a,610.1b)--(221.2a,610.1b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
put_text( btex pion-corr etex, 569.5a, 665.0b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.5804*red+0*green+0.8275*blue;
put_text( btex $P_z = 0$ etex, 1059.4a, 591.8b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.5804*red+0*green+0.8275*blue;
draw (1077.1a,591.8b)--(1164.5a,591.8b);
draw (1077.1a,600.1b)--(1077.1a,583.5b);
draw (1164.5a,600.1b)--(1164.5a,583.5b);
draw (221.2a,581.3b)--(221.2a,582.2b);
draw (221.2a,581.3b)--(229.5a,581.3b);
draw (221.2a,582.2b)--(229.5a,582.2b);
draw (256.0a,582.6b)--(256.0a,583.4b);
draw (247.7a,582.6b)--(264.3a,582.6b);
draw (247.7a,583.4b)--(264.3a,583.4b);
draw (290.9a,576.6b)--(290.9a,577.5b);
draw (282.6a,576.6b)--(299.2a,576.6b);
draw (282.6a,577.5b)--(299.2a,577.5b);
draw (325.7a,573.1b)--(325.7a,573.9b);
draw (317.4a,573.1b)--(334.0a,573.1b);
draw (317.4a,573.9b)--(334.0a,573.9b);
draw (360.5a,569.7b)--(360.5a,570.6b);
draw (352.2a,569.7b)--(368.8a,569.7b);
draw (352.2a,570.6b)--(368.8a,570.6b);
draw (395.4a,566.5b)--(395.4a,567.4b);
draw (387.1a,566.5b)--(403.7a,566.5b);
draw (387.1a,567.4b)--(403.7a,567.4b);
draw (430.2a,563.3b)--(430.2a,564.2b);
draw (421.9a,563.3b)--(438.5a,563.3b);
draw (421.9a,564.2b)--(438.5a,564.2b);
draw (465.0a,560.2b)--(465.0a,561.0b);
draw (456.7a,560.2b)--(473.3a,560.2b);
draw (456.7a,561.0b)--(473.3a,561.0b);
draw (499.8a,557.1b)--(499.8a,557.9b);
draw (491.5a,557.1b)--(508.1a,557.1b);
draw (491.5a,557.9b)--(508.1a,557.9b);
draw (534.7a,554.1b)--(534.7a,554.9b);
draw (526.4a,554.1b)--(543.0a,554.1b);
draw (526.4a,554.9b)--(543.0a,554.9b);
draw (569.5a,551.0b)--(569.5a,551.8b);
draw (561.2a,551.0b)--(577.8a,551.0b);
draw (561.2a,551.8b)--(577.8a,551.8b);
draw (604.3a,547.9b)--(604.3a,548.7b);
draw (596.0a,547.9b)--(612.6a,547.9b);
draw (596.0a,548.7b)--(612.6a,548.7b);
draw (639.2a,544.8b)--(639.2a,545.6b);
draw (630.9a,544.8b)--(647.5a,544.8b);
draw (630.9a,545.6b)--(647.5a,545.6b);
draw (674.0a,541.7b)--(674.0a,542.6b);
draw (665.7a,541.7b)--(682.3a,541.7b);
draw (665.7a,542.6b)--(682.3a,542.6b);
draw (708.8a,538.6b)--(708.8a,539.5b);
draw (700.5a,538.6b)--(717.1a,538.6b);
draw (700.5a,539.5b)--(717.1a,539.5b);
draw (743.7a,535.4b)--(743.7a,536.4b);
draw (735.4a,535.4b)--(752.0a,535.4b);
draw (735.4a,536.4b)--(752.0a,536.4b);
draw (778.5a,532.3b)--(778.5a,533.3b);
draw (770.2a,532.3b)--(786.8a,532.3b);
draw (770.2a,533.3b)--(786.8a,533.3b);
draw (813.3a,529.2b)--(813.3a,530.2b);
draw (805.0a,529.2b)--(821.6a,529.2b);
draw (805.0a,530.2b)--(821.6a,530.2b);
draw (848.1a,526.1b)--(848.1a,527.0b);
draw (839.8a,526.1b)--(856.4a,526.1b);
draw (839.8a,527.0b)--(856.4a,527.0b);
draw (883.0a,523.1b)--(883.0a,524.0b);
draw (874.7a,523.1b)--(891.3a,523.1b);
draw (874.7a,524.0b)--(891.3a,524.0b);
draw (917.8a,520.0b)--(917.8a,521.0b);
draw (909.5a,520.0b)--(917.8a,520.0b);
draw (909.5a,521.0b)--(917.8a,521.0b);
gpdraw(0,221.2a,581.7b);
gpdraw(0,256.0a,583.0b);
gpdraw(0,290.9a,577.1b);
gpdraw(0,325.7a,573.5b);
gpdraw(0,360.5a,570.1b);
gpdraw(0,395.4a,567.0b);
gpdraw(0,430.2a,563.8b);
gpdraw(0,465.0a,560.6b);
gpdraw(0,499.8a,557.5b);
gpdraw(0,534.7a,554.5b);
gpdraw(0,569.5a,551.4b);
gpdraw(0,604.3a,548.3b);
gpdraw(0,639.2a,545.2b);
gpdraw(0,674.0a,542.2b);
gpdraw(0,708.8a,539.1b);
gpdraw(0,743.7a,535.9b);
gpdraw(0,778.5a,532.8b);
gpdraw(0,813.3a,529.7b);
gpdraw(0,848.1a,526.5b);
gpdraw(0,883.0a,523.5b);
gpdraw(0,917.8a,520.5b);
gpdraw(0,1120.8a,591.8b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0*red+0.6196*green+0.451*blue;
put_text( btex $P_z = 1$ etex, 1059.4a, 555.2b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0*red+0.6196*green+0.451*blue;
draw (1077.1a,555.2b)--(1164.5a,555.2b);
draw (1077.1a,563.5b)--(1077.1a,546.9b);
draw (1164.5a,563.5b)--(1164.5a,546.9b);
draw (221.2a,553.8b)--(221.2a,554.8b);
draw (221.2a,553.8b)--(229.5a,553.8b);
draw (221.2a,554.8b)--(229.5a,554.8b);
draw (256.0a,556.8b)--(256.0a,557.7b);
draw (247.7a,556.8b)--(264.3a,556.8b);
draw (247.7a,557.7b)--(264.3a,557.7b);
draw (290.9a,545.5b)--(290.9a,546.5b);
draw (282.6a,545.5b)--(299.2a,545.5b);
draw (282.6a,546.5b)--(299.2a,546.5b);
draw (325.7a,538.6b)--(325.7a,539.7b);
draw (317.4a,538.6b)--(334.0a,538.6b);
draw (317.4a,539.7b)--(334.0a,539.7b);
draw (360.5a,532.2b)--(360.5a,533.2b);
draw (352.2a,532.2b)--(368.8a,532.2b);
draw (352.2a,533.2b)--(368.8a,533.2b);
draw (395.4a,526.0b)--(395.4a,527.0b);
draw (387.1a,526.0b)--(403.7a,526.0b);
draw (387.1a,527.0b)--(403.7a,527.0b);
draw (430.2a,519.9b)--(430.2a,520.9b);
draw (421.9a,519.9b)--(438.5a,519.9b);
draw (421.9a,520.9b)--(438.5a,520.9b);
draw (465.0a,513.8b)--(465.0a,514.9b);
draw (456.7a,513.8b)--(473.3a,513.8b);
draw (456.7a,514.9b)--(473.3a,514.9b);
draw (499.8a,507.7b)--(499.8a,508.9b);
draw (491.5a,507.7b)--(508.1a,507.7b);
draw (491.5a,508.9b)--(508.1a,508.9b);
draw (534.7a,501.7b)--(534.7a,502.9b);
draw (526.4a,501.7b)--(543.0a,501.7b);
draw (526.4a,502.9b)--(543.0a,502.9b);
draw (569.5a,495.8b)--(569.5a,497.0b);
draw (561.2a,495.8b)--(577.8a,495.8b);
draw (561.2a,497.0b)--(577.8a,497.0b);
draw (604.3a,489.9b)--(604.3a,491.0b);
draw (596.0a,489.9b)--(612.6a,489.9b);
draw (596.0a,491.0b)--(612.6a,491.0b);
draw (639.2a,483.8b)--(639.2a,485.0b);
draw (630.9a,483.8b)--(647.5a,483.8b);
draw (630.9a,485.0b)--(647.5a,485.0b);
draw (674.0a,477.9b)--(674.0a,479.1b);
draw (665.7a,477.9b)--(682.3a,477.9b);
draw (665.7a,479.1b)--(682.3a,479.1b);
draw (708.8a,471.9b)--(708.8a,473.0b);
draw (700.5a,471.9b)--(717.1a,471.9b);
draw (700.5a,473.0b)--(717.1a,473.0b);
draw (743.7a,465.9b)--(743.7a,467.0b);
draw (735.4a,465.9b)--(752.0a,465.9b);
draw (735.4a,467.0b)--(752.0a,467.0b);
draw (778.5a,459.7b)--(778.5a,460.9b);
draw (770.2a,459.7b)--(786.8a,459.7b);
draw (770.2a,460.9b)--(786.8a,460.9b);
draw (813.3a,453.7b)--(813.3a,454.9b);
draw (805.0a,453.7b)--(821.6a,453.7b);
draw (805.0a,454.9b)--(821.6a,454.9b);
draw (848.1a,447.5b)--(848.1a,448.8b);
draw (839.8a,447.5b)--(856.4a,447.5b);
draw (839.8a,448.8b)--(856.4a,448.8b);
draw (883.0a,441.7b)--(883.0a,443.0b);
draw (874.7a,441.7b)--(891.3a,441.7b);
draw (874.7a,443.0b)--(891.3a,443.0b);
draw (917.8a,435.9b)--(917.8a,437.3b);
draw (909.5a,435.9b)--(917.8a,435.9b);
draw (909.5a,437.3b)--(917.8a,437.3b);
gpdraw(1,221.2a,554.3b);
gpdraw(1,256.0a,557.3b);
gpdraw(1,290.9a,546.0b);
gpdraw(1,325.7a,539.1b);
gpdraw(1,360.5a,532.7b);
gpdraw(1,395.4a,526.5b);
gpdraw(1,430.2a,520.4b);
gpdraw(1,465.0a,514.3b);
gpdraw(1,499.8a,508.3b);
gpdraw(1,534.7a,502.3b);
gpdraw(1,569.5a,496.4b);
gpdraw(1,604.3a,490.4b);
gpdraw(1,639.2a,484.4b);
gpdraw(1,674.0a,478.5b);
gpdraw(1,708.8a,472.4b);
gpdraw(1,743.7a,466.4b);
gpdraw(1,778.5a,460.3b);
gpdraw(1,813.3a,454.3b);
gpdraw(1,848.1a,448.2b);
gpdraw(1,883.0a,442.3b);
gpdraw(1,917.8a,436.6b);
gpdraw(1,1120.8a,555.2b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.3373*red+0.7059*green+0.9137*blue;
put_text( btex $P_z = 2$ etex, 1059.4a, 518.6b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.3373*red+0.7059*green+0.9137*blue;
draw (1077.1a,518.6b)--(1164.5a,518.6b);
draw (1077.1a,526.9b)--(1077.1a,510.3b);
draw (1164.5a,526.9b)--(1164.5a,510.3b);
draw (221.2a,523.7b)--(221.2a,524.7b);
draw (221.2a,523.7b)--(229.5a,523.7b);
draw (221.2a,524.7b)--(229.5a,524.7b);
draw (256.0a,532.5b)--(256.0a,533.3b);
draw (247.7a,532.5b)--(264.3a,532.5b);
draw (247.7a,533.3b)--(264.3a,533.3b);
draw (290.9a,512.3b)--(290.9a,513.4b);
draw (282.6a,512.3b)--(299.2a,512.3b);
draw (282.6a,513.4b)--(299.2a,513.4b);
draw (325.7a,500.0b)--(325.7a,501.4b);
draw (317.4a,500.0b)--(334.0a,500.0b);
draw (317.4a,501.4b)--(334.0a,501.4b);
draw (360.5a,488.6b)--(360.5a,490.1b);
draw (352.2a,488.6b)--(368.8a,488.6b);
draw (352.2a,490.1b)--(368.8a,490.1b);
draw (395.4a,477.4b)--(395.4a,479.1b);
draw (387.1a,477.4b)--(403.7a,477.4b);
draw (387.1a,479.1b)--(403.7a,479.1b);
draw (430.2a,466.3b)--(430.2a,468.2b);
draw (421.9a,466.3b)--(438.5a,466.3b);
draw (421.9a,468.2b)--(438.5a,468.2b);
draw (465.0a,455.1b)--(465.0a,457.5b);
draw (456.7a,455.1b)--(473.3a,455.1b);
draw (456.7a,457.5b)--(473.3a,457.5b);
draw (499.8a,443.6b)--(499.8a,446.8b);
draw (491.5a,443.6b)--(508.1a,443.6b);
draw (491.5a,446.8b)--(508.1a,446.8b);
draw (534.7a,432.8b)--(534.7a,436.5b);
draw (526.4a,432.8b)--(543.0a,432.8b);
draw (526.4a,436.5b)--(543.0a,436.5b);
draw (569.5a,421.5b)--(569.5a,425.5b);
draw (561.2a,421.5b)--(577.8a,421.5b);
draw (561.2a,425.5b)--(577.8a,425.5b);
draw (604.3a,409.1b)--(604.3a,413.9b);
draw (596.0a,409.1b)--(612.6a,409.1b);
draw (596.0a,413.9b)--(612.6a,413.9b);
draw (639.2a,398.1b)--(639.2a,403.3b);
draw (630.9a,398.1b)--(647.5a,398.1b);
draw (630.9a,403.3b)--(647.5a,403.3b);
draw (674.0a,386.4b)--(674.0a,392.3b);
draw (665.7a,386.4b)--(682.3a,386.4b);
draw (665.7a,392.3b)--(682.3a,392.3b);
draw (708.8a,372.9b)--(708.8a,380.9b);
draw (700.5a,372.9b)--(717.1a,372.9b);
draw (700.5a,380.9b)--(717.1a,380.9b);
draw (743.7a,363.3b)--(743.7a,371.5b);
draw (735.4a,363.3b)--(752.0a,363.3b);
draw (735.4a,371.5b)--(752.0a,371.5b);
draw (778.5a,355.7b)--(778.5a,364.0b);
draw (770.2a,355.7b)--(786.8a,355.7b);
draw (770.2a,364.0b)--(786.8a,364.0b);
draw (813.3a,353.2b)--(813.3a,362.0b);
draw (805.0a,353.2b)--(821.6a,353.2b);
draw (805.0a,362.0b)--(821.6a,362.0b);
draw (848.1a,344.4b)--(848.1a,355.3b);
draw (839.8a,344.4b)--(856.4a,344.4b);
draw (839.8a,355.3b)--(856.4a,355.3b);
draw (883.0a,333.0b)--(883.0a,346.4b);
draw (874.7a,333.0b)--(891.3a,333.0b);
draw (874.7a,346.4b)--(891.3a,346.4b);
draw (917.8a,324.5b)--(917.8a,340.0b);
draw (909.5a,324.5b)--(917.8a,324.5b);
draw (909.5a,340.0b)--(917.8a,340.0b);
gpdraw(2,221.2a,524.2b);
gpdraw(2,256.0a,532.9b);
gpdraw(2,290.9a,512.9b);
gpdraw(2,325.7a,500.7b);
gpdraw(2,360.5a,489.3b);
gpdraw(2,395.4a,478.3b);
gpdraw(2,430.2a,467.3b);
gpdraw(2,465.0a,456.3b);
gpdraw(2,499.8a,445.3b);
gpdraw(2,534.7a,434.7b);
gpdraw(2,569.5a,423.6b);
gpdraw(2,604.3a,411.6b);
gpdraw(2,639.2a,400.8b);
gpdraw(2,674.0a,389.5b);
gpdraw(2,708.8a,377.1b);
gpdraw(2,743.7a,367.6b);
gpdraw(2,778.5a,360.1b);
gpdraw(2,813.3a,357.8b);
gpdraw(2,848.1a,350.2b);
gpdraw(2,883.0a,340.3b);
gpdraw(2,917.8a,333.0b);
gpdraw(2,1120.8a,518.6b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.902*red+0.6235*green+0*blue;
put_text( btex $P_z = 3$ etex, 1059.4a, 482.0b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.902*red+0.6235*green+0*blue;
draw (1077.1a,482.0b)--(1164.5a,482.0b);
draw (1077.1a,490.3b)--(1077.1a,473.7b);
draw (1164.5a,490.3b)--(1164.5a,473.7b);
draw (221.2a,491.7b)--(221.2a,492.8b);
draw (221.2a,491.7b)--(229.5a,491.7b);
draw (221.2a,492.8b)--(229.5a,492.8b);
draw (256.0a,514.3b)--(256.0a,515.0b);
draw (247.7a,514.3b)--(264.3a,514.3b);
draw (247.7a,515.0b)--(264.3a,515.0b);
draw (290.9a,484.8b)--(290.9a,485.8b);
draw (282.6a,484.8b)--(299.2a,484.8b);
draw (282.6a,485.8b)--(299.2a,485.8b);
draw (325.7a,467.1b)--(325.7a,468.2b);
draw (317.4a,467.1b)--(334.0a,467.1b);
draw (317.4a,468.2b)--(334.0a,468.2b);
draw (360.5a,450.2b)--(360.5a,451.5b);
draw (352.2a,450.2b)--(368.8a,450.2b);
draw (352.2a,451.5b)--(368.8a,451.5b);
draw (395.4a,433.3b)--(395.4a,434.8b);
draw (387.1a,433.3b)--(403.7a,433.3b);
draw (387.1a,434.8b)--(403.7a,434.8b);
draw (430.2a,416.6b)--(430.2a,418.5b);
draw (421.9a,416.6b)--(438.5a,416.6b);
draw (421.9a,418.5b)--(438.5a,418.5b);
draw (465.0a,401.6b)--(465.0a,405.0b);
draw (456.7a,401.6b)--(473.3a,401.6b);
draw (456.7a,405.0b)--(473.3a,405.0b);
draw (499.8a,384.8b)--(499.8a,390.2b);
draw (491.5a,384.8b)--(508.1a,384.8b);
draw (491.5a,390.2b)--(508.1a,390.2b);
draw (534.7a,369.7b)--(534.7a,376.6b);
draw (526.4a,369.7b)--(543.0a,369.7b);
draw (526.4a,376.6b)--(543.0a,376.6b);
draw (569.5a,351.5b)--(569.5a,358.8b);
draw (561.2a,351.5b)--(577.8a,351.5b);
draw (561.2a,358.8b)--(577.8a,358.8b);
draw (604.3a,330.1b)--(604.3a,339.9b);
draw (596.0a,330.1b)--(612.6a,330.1b);
draw (596.0a,339.9b)--(612.6a,339.9b);
draw (639.2a,315.0b)--(639.2a,327.6b);
draw (630.9a,315.0b)--(647.5a,315.0b);
draw (630.9a,327.6b)--(647.5a,327.6b);
draw (674.0a,280.3b)--(674.0a,305.8b);
draw (665.7a,280.3b)--(682.3a,280.3b);
draw (665.7a,305.8b)--(682.3a,305.8b);
draw (708.8a,73.2b)--(708.8a,272.9b);
draw (700.5a,73.2b)--(717.1a,73.2b);
draw (700.5a,272.9b)--(717.1a,272.9b);
draw (743.7a,73.2b)--(743.7a,272.9b);
draw (735.4a,73.2b)--(752.0a,73.2b);
draw (735.4a,272.9b)--(752.0a,272.9b);
draw (778.5a,73.2b)--(778.5a,264.1b);
draw (770.2a,73.2b)--(786.8a,73.2b);
draw (770.2a,264.1b)--(786.8a,264.1b);
draw (813.3a,202.9b)--(813.3a,279.4b);
draw (805.0a,202.9b)--(821.6a,202.9b);
draw (805.0a,279.4b)--(821.6a,279.4b);
draw (848.1a,173.6b)--(848.1a,269.2b);
draw (839.8a,173.6b)--(856.4a,173.6b);
draw (839.8a,269.2b)--(856.4a,269.2b);
draw (883.0a,73.2b)--(883.0a,245.3b);
draw (874.7a,73.2b)--(891.3a,73.2b);
draw (874.7a,245.3b)--(891.3a,245.3b);
draw (917.8a,73.2b)--(917.8a,246.1b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,246.1b)--(917.8a,246.1b);
gpdraw(3,221.2a,492.3b);
gpdraw(3,256.0a,514.7b);
gpdraw(3,290.9a,485.3b);
gpdraw(3,325.7a,467.6b);
gpdraw(3,360.5a,450.8b);
gpdraw(3,395.4a,434.0b);
gpdraw(3,430.2a,417.6b);
gpdraw(3,465.0a,403.3b);
gpdraw(3,499.8a,387.6b);
gpdraw(3,534.7a,373.3b);
gpdraw(3,569.5a,355.3b);
gpdraw(3,604.3a,335.3b);
gpdraw(3,639.2a,321.8b);
gpdraw(3,674.0a,295.1b);
gpdraw(3,708.8a,225.8b);
gpdraw(3,743.7a,235.0b);
gpdraw(3,778.5a,215.5b);
gpdraw(3,813.3a,257.5b);
gpdraw(3,848.1a,245.4b);
gpdraw(3,883.0a,177.4b);
gpdraw(3,917.8a,200.8b);
gpdraw(3,1120.8a,482.0b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.9412*red+0.8941*green+0.2588*blue;
put_text( btex $P_z = 4$ etex, 1059.4a, 445.4b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
currentcolor:=0.9412*red+0.8941*green+0.2588*blue;
draw (1077.1a,445.4b)--(1164.5a,445.4b);
draw (1077.1a,453.7b)--(1077.1a,437.1b);
draw (1164.5a,453.7b)--(1164.5a,437.1b);
draw (221.2a,428.6b)--(221.2a,431.9b);
draw (221.2a,428.6b)--(229.5a,428.6b);
draw (221.2a,431.9b)--(229.5a,431.9b);
draw (256.0a,499.2b)--(256.0a,499.8b);
draw (247.7a,499.2b)--(264.3a,499.2b);
draw (247.7a,499.8b)--(264.3a,499.8b);
draw (290.9a,459.6b)--(290.9a,460.8b);
draw (282.6a,459.6b)--(299.2a,459.6b);
draw (282.6a,460.8b)--(299.2a,460.8b);
draw (325.7a,435.9b)--(325.7a,437.6b);
draw (317.4a,435.9b)--(334.0a,435.9b);
draw (317.4a,437.6b)--(334.0a,437.6b);
draw (360.5a,412.9b)--(360.5a,415.5b);
draw (352.2a,412.9b)--(368.8a,412.9b);
draw (352.2a,415.5b)--(368.8a,415.5b);
draw (395.4a,389.0b)--(395.4a,392.6b);
draw (387.1a,389.0b)--(403.7a,389.0b);
draw (387.1a,392.6b)--(403.7a,392.6b);
draw (430.2a,366.4b)--(430.2a,372.2b);
draw (421.9a,366.4b)--(438.5a,366.4b);
draw (421.9a,372.2b)--(438.5a,372.2b);
draw (465.0a,347.9b)--(465.0a,355.3b);
draw (456.7a,347.9b)--(473.3a,347.9b);
draw (456.7a,355.3b)--(473.3a,355.3b);
draw (499.8a,325.9b)--(499.8a,337.3b);
draw (491.5a,325.9b)--(508.1a,325.9b);
draw (491.5a,337.3b)--(508.1a,337.3b);
draw (534.7a,309.7b)--(534.7a,330.0b);
draw (526.4a,309.7b)--(543.0a,309.7b);
draw (526.4a,330.0b)--(543.0a,330.0b);
draw (569.5a,256.2b)--(569.5a,301.3b);
draw (561.2a,256.2b)--(577.8a,256.2b);
draw (561.2a,301.3b)--(577.8a,301.3b);
draw (604.3a,85.2b)--(604.3a,281.7b);
draw (596.0a,85.2b)--(612.6a,85.2b);
draw (596.0a,281.7b)--(612.6a,281.7b);
draw (639.2a,73.2b)--(639.2a,272.5b);
draw (630.9a,73.2b)--(647.5a,73.2b);
draw (630.9a,272.5b)--(647.5a,272.5b);
gpdraw(4,221.2a,430.3b);
gpdraw(4,256.0a,499.5b);
gpdraw(4,290.9a,460.2b);
gpdraw(4,325.7a,436.8b);
gpdraw(4,360.5a,414.2b);
gpdraw(4,395.4a,390.8b);
gpdraw(4,430.2a,369.4b);
gpdraw(4,465.0a,351.8b);
gpdraw(4,499.8a,332.0b);
gpdraw(4,534.7a,321.1b);
gpdraw(4,569.5a,284.9b);
gpdraw(4,604.3a,255.0b);
gpdraw(4,639.2a,241.4b);
gpdraw(4,1120.8a,445.4b);
scalepen 2.000;
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
scalepen 1.000;
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,610.1b)--(221.2a,73.2b)--(917.8a,73.2b)--(917.8a,610.1b)--(221.2a,610.1b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
endfig;
% BEGPOST
verbatimtex
 \end{document}
etex
% ENDPOST
end.
