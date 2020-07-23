%GNUPLOT Metapost output: Thu Jul 23 12:17:39 2020

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
draw (221.2a,96.3b)--(229.5a,96.3b);
draw (917.8a,96.3b)--(909.5a,96.3b);
draw (221.2a,109.8b)--(229.5a,109.8b);
draw (917.8a,109.8b)--(909.5a,109.8b);
draw (221.2a,119.4b)--(229.5a,119.4b);
draw (917.8a,119.4b)--(909.5a,119.4b);
draw (221.2a,126.8b)--(229.5a,126.8b);
draw (917.8a,126.8b)--(909.5a,126.8b);
draw (221.2a,132.9b)--(229.5a,132.9b);
draw (917.8a,132.9b)--(909.5a,132.9b);
draw (221.2a,138.0b)--(229.5a,138.0b);
draw (917.8a,138.0b)--(909.5a,138.0b);
draw (221.2a,142.5b)--(229.5a,142.5b);
draw (917.8a,142.5b)--(909.5a,142.5b);
draw (221.2a,146.4b)--(229.5a,146.4b);
draw (917.8a,146.4b)--(909.5a,146.4b);
draw (221.2a,149.9b)--(237.8a,149.9b);
draw (917.8a,149.9b)--(901.2a,149.9b);
put_text( btex 0.00000010 etex, 203.5a, 149.9b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,173.0b)--(229.5a,173.0b);
draw (917.8a,173.0b)--(909.5a,173.0b);
draw (221.2a,186.5b)--(229.5a,186.5b);
draw (917.8a,186.5b)--(909.5a,186.5b);
draw (221.2a,196.1b)--(229.5a,196.1b);
draw (917.8a,196.1b)--(909.5a,196.1b);
draw (221.2a,203.5b)--(229.5a,203.5b);
draw (917.8a,203.5b)--(909.5a,203.5b);
draw (221.2a,209.6b)--(229.5a,209.6b);
draw (917.8a,209.6b)--(909.5a,209.6b);
draw (221.2a,214.7b)--(229.5a,214.7b);
draw (917.8a,214.7b)--(909.5a,214.7b);
draw (221.2a,219.2b)--(229.5a,219.2b);
draw (917.8a,219.2b)--(909.5a,219.2b);
draw (221.2a,223.1b)--(229.5a,223.1b);
draw (917.8a,223.1b)--(909.5a,223.1b);
draw (221.2a,226.6b)--(237.8a,226.6b);
draw (917.8a,226.6b)--(901.2a,226.6b);
put_text( btex 0.00000100 etex, 203.5a, 226.6b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,249.7b)--(229.5a,249.7b);
draw (917.8a,249.7b)--(909.5a,249.7b);
draw (221.2a,263.2b)--(229.5a,263.2b);
draw (917.8a,263.2b)--(909.5a,263.2b);
draw (221.2a,272.8b)--(229.5a,272.8b);
draw (917.8a,272.8b)--(909.5a,272.8b);
draw (221.2a,280.2b)--(229.5a,280.2b);
draw (917.8a,280.2b)--(909.5a,280.2b);
draw (221.2a,286.3b)--(229.5a,286.3b);
draw (917.8a,286.3b)--(909.5a,286.3b);
draw (221.2a,291.4b)--(229.5a,291.4b);
draw (917.8a,291.4b)--(909.5a,291.4b);
draw (221.2a,295.9b)--(229.5a,295.9b);
draw (917.8a,295.9b)--(909.5a,295.9b);
draw (221.2a,299.8b)--(229.5a,299.8b);
draw (917.8a,299.8b)--(909.5a,299.8b);
draw (221.2a,303.3b)--(237.8a,303.3b);
draw (917.8a,303.3b)--(901.2a,303.3b);
put_text( btex 0.00001000 etex, 203.5a, 303.3b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,326.4b)--(229.5a,326.4b);
draw (917.8a,326.4b)--(909.5a,326.4b);
draw (221.2a,339.9b)--(229.5a,339.9b);
draw (917.8a,339.9b)--(909.5a,339.9b);
draw (221.2a,349.5b)--(229.5a,349.5b);
draw (917.8a,349.5b)--(909.5a,349.5b);
draw (221.2a,356.9b)--(229.5a,356.9b);
draw (917.8a,356.9b)--(909.5a,356.9b);
draw (221.2a,363.0b)--(229.5a,363.0b);
draw (917.8a,363.0b)--(909.5a,363.0b);
draw (221.2a,368.1b)--(229.5a,368.1b);
draw (917.8a,368.1b)--(909.5a,368.1b);
draw (221.2a,372.6b)--(229.5a,372.6b);
draw (917.8a,372.6b)--(909.5a,372.6b);
draw (221.2a,376.5b)--(229.5a,376.5b);
draw (917.8a,376.5b)--(909.5a,376.5b);
draw (221.2a,380.0b)--(237.8a,380.0b);
draw (917.8a,380.0b)--(901.2a,380.0b);
put_text( btex 0.00010000 etex, 203.5a, 380.0b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,403.1b)--(229.5a,403.1b);
draw (917.8a,403.1b)--(909.5a,403.1b);
draw (221.2a,416.6b)--(229.5a,416.6b);
draw (917.8a,416.6b)--(909.5a,416.6b);
draw (221.2a,426.2b)--(229.5a,426.2b);
draw (917.8a,426.2b)--(909.5a,426.2b);
draw (221.2a,433.6b)--(229.5a,433.6b);
draw (917.8a,433.6b)--(909.5a,433.6b);
draw (221.2a,439.7b)--(229.5a,439.7b);
draw (917.8a,439.7b)--(909.5a,439.7b);
draw (221.2a,444.8b)--(229.5a,444.8b);
draw (917.8a,444.8b)--(909.5a,444.8b);
draw (221.2a,449.3b)--(229.5a,449.3b);
draw (917.8a,449.3b)--(909.5a,449.3b);
draw (221.2a,453.2b)--(229.5a,453.2b);
draw (917.8a,453.2b)--(909.5a,453.2b);
draw (221.2a,456.7b)--(237.8a,456.7b);
draw (917.8a,456.7b)--(901.2a,456.7b);
put_text( btex 0.00100000 etex, 203.5a, 456.7b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,479.8b)--(229.5a,479.8b);
draw (917.8a,479.8b)--(909.5a,479.8b);
draw (221.2a,493.3b)--(229.5a,493.3b);
draw (917.8a,493.3b)--(909.5a,493.3b);
draw (221.2a,502.9b)--(229.5a,502.9b);
draw (917.8a,502.9b)--(909.5a,502.9b);
draw (221.2a,510.3b)--(229.5a,510.3b);
draw (917.8a,510.3b)--(909.5a,510.3b);
draw (221.2a,516.4b)--(229.5a,516.4b);
draw (917.8a,516.4b)--(909.5a,516.4b);
draw (221.2a,521.5b)--(229.5a,521.5b);
draw (917.8a,521.5b)--(909.5a,521.5b);
draw (221.2a,526.0b)--(229.5a,526.0b);
draw (917.8a,526.0b)--(909.5a,526.0b);
draw (221.2a,529.9b)--(229.5a,529.9b);
draw (917.8a,529.9b)--(909.5a,529.9b);
draw (221.2a,533.4b)--(237.8a,533.4b);
draw (917.8a,533.4b)--(901.2a,533.4b);
put_text( btex 0.01000000 etex, 203.5a, 533.4b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (221.2a,556.5b)--(229.5a,556.5b);
draw (917.8a,556.5b)--(909.5a,556.5b);
draw (221.2a,570.0b)--(229.5a,570.0b);
draw (917.8a,570.0b)--(909.5a,570.0b);
draw (221.2a,579.6b)--(229.5a,579.6b);
draw (917.8a,579.6b)--(909.5a,579.6b);
draw (221.2a,587.0b)--(229.5a,587.0b);
draw (917.8a,587.0b)--(909.5a,587.0b);
draw (221.2a,593.1b)--(229.5a,593.1b);
draw (917.8a,593.1b)--(909.5a,593.1b);
draw (221.2a,598.2b)--(229.5a,598.2b);
draw (917.8a,598.2b)--(909.5a,598.2b);
draw (221.2a,602.7b)--(229.5a,602.7b);
draw (917.8a,602.7b)--(909.5a,602.7b);
draw (221.2a,606.6b)--(229.5a,606.6b);
draw (917.8a,606.6b)--(909.5a,606.6b);
draw (221.2a,610.1b)--(237.8a,610.1b);
draw (917.8a,610.1b)--(901.2a,610.1b);
put_text( btex 0.10000000 etex, 203.5a, 610.1b, 0, 3);
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
draw (221.2a,560.5b)--(221.2a,560.7b);
draw (221.2a,560.5b)--(229.5a,560.5b);
draw (221.2a,560.7b)--(229.5a,560.7b);
draw (256.0a,557.6b)--(256.0a,557.9b);
draw (247.7a,557.6b)--(264.3a,557.6b);
draw (247.7a,557.9b)--(264.3a,557.9b);
draw (290.9a,551.8b)--(290.9a,552.1b);
draw (282.6a,551.8b)--(299.2a,551.8b);
draw (282.6a,552.1b)--(299.2a,552.1b);
draw (325.7a,546.9b)--(325.7a,547.2b);
draw (317.4a,546.9b)--(334.0a,546.9b);
draw (317.4a,547.2b)--(334.0a,547.2b);
draw (360.5a,542.2b)--(360.5a,542.5b);
draw (352.2a,542.2b)--(368.8a,542.2b);
draw (352.2a,542.5b)--(368.8a,542.5b);
draw (395.4a,537.6b)--(395.4a,537.9b);
draw (387.1a,537.6b)--(403.7a,537.6b);
draw (387.1a,537.9b)--(403.7a,537.9b);
draw (430.2a,532.9b)--(430.2a,533.2b);
draw (421.9a,532.9b)--(438.5a,532.9b);
draw (421.9a,533.2b)--(438.5a,533.2b);
draw (465.0a,528.3b)--(465.0a,528.6b);
draw (456.7a,528.3b)--(473.3a,528.3b);
draw (456.7a,528.6b)--(473.3a,528.6b);
draw (499.8a,523.7b)--(499.8a,524.0b);
draw (491.5a,523.7b)--(508.1a,523.7b);
draw (491.5a,524.0b)--(508.1a,524.0b);
draw (534.7a,519.1b)--(534.7a,519.4b);
draw (526.4a,519.1b)--(543.0a,519.1b);
draw (526.4a,519.4b)--(543.0a,519.4b);
draw (569.5a,514.5b)--(569.5a,514.8b);
draw (561.2a,514.5b)--(577.8a,514.5b);
draw (561.2a,514.8b)--(577.8a,514.8b);
draw (604.3a,509.9b)--(604.3a,510.2b);
draw (596.0a,509.9b)--(612.6a,509.9b);
draw (596.0a,510.2b)--(612.6a,510.2b);
draw (639.2a,505.2b)--(639.2a,505.5b);
draw (630.9a,505.2b)--(647.5a,505.2b);
draw (630.9a,505.5b)--(647.5a,505.5b);
draw (674.0a,500.6b)--(674.0a,501.0b);
draw (665.7a,500.6b)--(682.3a,500.6b);
draw (665.7a,501.0b)--(682.3a,501.0b);
draw (708.8a,495.9b)--(708.8a,496.3b);
draw (700.5a,495.9b)--(717.1a,495.9b);
draw (700.5a,496.3b)--(717.1a,496.3b);
draw (743.7a,491.4b)--(743.7a,491.8b);
draw (735.4a,491.4b)--(752.0a,491.4b);
draw (735.4a,491.8b)--(752.0a,491.8b);
draw (778.5a,486.8b)--(778.5a,487.2b);
draw (770.2a,486.8b)--(786.8a,486.8b);
draw (770.2a,487.2b)--(786.8a,487.2b);
draw (813.3a,482.3b)--(813.3a,482.7b);
draw (805.0a,482.3b)--(821.6a,482.3b);
draw (805.0a,482.7b)--(821.6a,482.7b);
draw (848.1a,477.9b)--(848.1a,478.3b);
draw (839.8a,477.9b)--(856.4a,477.9b);
draw (839.8a,478.3b)--(856.4a,478.3b);
draw (883.0a,473.4b)--(883.0a,473.9b);
draw (874.7a,473.4b)--(891.3a,473.4b);
draw (874.7a,473.9b)--(891.3a,473.9b);
draw (917.8a,469.0b)--(917.8a,469.4b);
draw (909.5a,469.0b)--(917.8a,469.0b);
draw (909.5a,469.4b)--(917.8a,469.4b);
gpdraw(0,221.2a,560.6b);
gpdraw(0,256.0a,557.8b);
gpdraw(0,290.9a,551.9b);
gpdraw(0,325.7a,547.1b);
gpdraw(0,360.5a,542.3b);
gpdraw(0,395.4a,537.7b);
gpdraw(0,430.2a,533.0b);
gpdraw(0,465.0a,528.5b);
gpdraw(0,499.8a,523.8b);
gpdraw(0,534.7a,519.2b);
gpdraw(0,569.5a,514.6b);
gpdraw(0,604.3a,510.0b);
gpdraw(0,639.2a,505.3b);
gpdraw(0,674.0a,500.8b);
gpdraw(0,708.8a,496.1b);
gpdraw(0,743.7a,491.6b);
gpdraw(0,778.5a,487.0b);
gpdraw(0,813.3a,482.5b);
gpdraw(0,848.1a,478.1b);
gpdraw(0,883.0a,473.6b);
gpdraw(0,917.8a,469.2b);
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
draw (221.2a,532.6b)--(221.2a,532.8b);
draw (221.2a,532.6b)--(229.5a,532.6b);
draw (221.2a,532.8b)--(229.5a,532.8b);
draw (256.0a,527.7b)--(256.0a,527.9b);
draw (247.7a,527.7b)--(264.3a,527.7b);
draw (247.7a,527.9b)--(264.3a,527.9b);
draw (290.9a,515.1b)--(290.9a,515.4b);
draw (282.6a,515.1b)--(299.2a,515.1b);
draw (282.6a,515.4b)--(299.2a,515.4b);
draw (325.7a,504.7b)--(325.7a,505.1b);
draw (317.4a,504.7b)--(334.0a,504.7b);
draw (317.4a,505.1b)--(334.0a,505.1b);
draw (360.5a,494.7b)--(360.5a,495.1b);
draw (352.2a,494.7b)--(368.8a,494.7b);
draw (352.2a,495.1b)--(368.8a,495.1b);
draw (395.4a,484.9b)--(395.4a,485.3b);
draw (387.1a,484.9b)--(403.7a,484.9b);
draw (387.1a,485.3b)--(403.7a,485.3b);
draw (430.2a,474.9b)--(430.2a,475.2b);
draw (421.9a,474.9b)--(438.5a,474.9b);
draw (421.9a,475.2b)--(438.5a,475.2b);
draw (465.0a,465.1b)--(465.0a,465.5b);
draw (456.7a,465.1b)--(473.3a,465.1b);
draw (456.7a,465.5b)--(473.3a,465.5b);
draw (499.8a,455.3b)--(499.8a,455.8b);
draw (491.5a,455.3b)--(508.1a,455.3b);
draw (491.5a,455.8b)--(508.1a,455.8b);
draw (534.7a,445.5b)--(534.7a,446.0b);
draw (526.4a,445.5b)--(543.0a,445.5b);
draw (526.4a,446.0b)--(543.0a,446.0b);
draw (569.5a,435.6b)--(569.5a,436.1b);
draw (561.2a,435.6b)--(577.8a,435.6b);
draw (561.2a,436.1b)--(577.8a,436.1b);
draw (604.3a,425.8b)--(604.3a,426.4b);
draw (596.0a,425.8b)--(612.6a,425.8b);
draw (596.0a,426.4b)--(612.6a,426.4b);
draw (639.2a,415.9b)--(639.2a,416.6b);
draw (630.9a,415.9b)--(647.5a,415.9b);
draw (630.9a,416.6b)--(647.5a,416.6b);
draw (674.0a,406.0b)--(674.0a,406.8b);
draw (665.7a,406.0b)--(682.3a,406.0b);
draw (665.7a,406.8b)--(682.3a,406.8b);
draw (708.8a,395.8b)--(708.8a,396.8b);
draw (700.5a,395.8b)--(717.1a,395.8b);
draw (700.5a,396.8b)--(717.1a,396.8b);
draw (743.7a,385.9b)--(743.7a,387.0b);
draw (735.4a,385.9b)--(752.0a,385.9b);
draw (735.4a,387.0b)--(752.0a,387.0b);
draw (778.5a,376.6b)--(778.5a,377.8b);
draw (770.2a,376.6b)--(786.8a,376.6b);
draw (770.2a,377.8b)--(786.8a,377.8b);
draw (813.3a,367.1b)--(813.3a,368.6b);
draw (805.0a,367.1b)--(821.6a,367.1b);
draw (805.0a,368.6b)--(821.6a,368.6b);
draw (848.1a,357.4b)--(848.1a,359.1b);
draw (839.8a,357.4b)--(856.4a,357.4b);
draw (839.8a,359.1b)--(856.4a,359.1b);
draw (883.0a,347.6b)--(883.0a,349.5b);
draw (874.7a,347.6b)--(891.3a,347.6b);
draw (874.7a,349.5b)--(891.3a,349.5b);
draw (917.8a,337.3b)--(917.8a,339.6b);
draw (909.5a,337.3b)--(917.8a,337.3b);
draw (909.5a,339.6b)--(917.8a,339.6b);
gpdraw(1,221.2a,532.7b);
gpdraw(1,256.0a,527.8b);
gpdraw(1,290.9a,515.3b);
gpdraw(1,325.7a,504.9b);
gpdraw(1,360.5a,494.9b);
gpdraw(1,395.4a,485.1b);
gpdraw(1,430.2a,475.1b);
gpdraw(1,465.0a,465.3b);
gpdraw(1,499.8a,455.5b);
gpdraw(1,534.7a,445.7b);
gpdraw(1,569.5a,435.8b);
gpdraw(1,604.3a,426.1b);
gpdraw(1,639.2a,416.3b);
gpdraw(1,674.0a,406.4b);
gpdraw(1,708.8a,396.3b);
gpdraw(1,743.7a,386.5b);
gpdraw(1,778.5a,377.2b);
gpdraw(1,813.3a,367.9b);
gpdraw(1,848.1a,358.3b);
gpdraw(1,883.0a,348.6b);
gpdraw(1,917.8a,338.5b);
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
draw (221.2a,501.9b)--(221.2a,502.2b);
draw (221.2a,501.9b)--(229.5a,501.9b);
draw (221.2a,502.2b)--(229.5a,502.2b);
draw (256.0a,498.7b)--(256.0a,499.0b);
draw (247.7a,498.7b)--(264.3a,498.7b);
draw (247.7a,499.0b)--(264.3a,499.0b);
draw (290.9a,475.6b)--(290.9a,476.1b);
draw (282.6a,475.6b)--(299.2a,475.6b);
draw (282.6a,476.1b)--(299.2a,476.1b);
draw (325.7a,456.6b)--(325.7a,457.3b);
draw (317.4a,456.6b)--(334.0a,456.6b);
draw (317.4a,457.3b)--(334.0a,457.3b);
draw (360.5a,438.6b)--(360.5a,439.5b);
draw (352.2a,438.6b)--(368.8a,438.6b);
draw (352.2a,439.5b)--(368.8a,439.5b);
draw (395.4a,421.0b)--(395.4a,422.4b);
draw (387.1a,421.0b)--(403.7a,421.0b);
draw (387.1a,422.4b)--(403.7a,422.4b);
draw (430.2a,402.8b)--(430.2a,404.7b);
draw (421.9a,402.8b)--(438.5a,402.8b);
draw (421.9a,404.7b)--(438.5a,404.7b);
draw (465.0a,384.5b)--(465.0a,386.9b);
draw (456.7a,384.5b)--(473.3a,384.5b);
draw (456.7a,386.9b)--(473.3a,386.9b);
draw (499.8a,367.2b)--(499.8a,370.7b);
draw (491.5a,367.2b)--(508.1a,367.2b);
draw (491.5a,370.7b)--(508.1a,370.7b);
draw (534.7a,346.7b)--(534.7a,352.5b);
draw (526.4a,346.7b)--(543.0a,346.7b);
draw (526.4a,352.5b)--(543.0a,352.5b);
draw (569.5a,333.9b)--(569.5a,340.8b);
draw (561.2a,333.9b)--(577.8a,333.9b);
draw (561.2a,340.8b)--(577.8a,340.8b);
draw (604.3a,322.8b)--(604.3a,331.6b);
draw (596.0a,322.8b)--(612.6a,322.8b);
draw (596.0a,331.6b)--(612.6a,331.6b);
draw (639.2a,303.1b)--(639.2a,315.9b);
draw (630.9a,303.1b)--(647.5a,303.1b);
draw (630.9a,315.9b)--(647.5a,315.9b);
draw (674.0a,280.9b)--(674.0a,299.5b);
draw (665.7a,280.9b)--(682.3a,280.9b);
draw (665.7a,299.5b)--(682.3a,299.5b);
draw (708.8a,260.2b)--(708.8a,287.2b);
draw (700.5a,260.2b)--(717.1a,260.2b);
draw (700.5a,287.2b)--(717.1a,287.2b);
draw (743.7a,225.9b)--(743.7a,269.6b);
draw (735.4a,225.9b)--(752.0a,225.9b);
draw (735.4a,269.6b)--(752.0a,269.6b);
draw (778.5a,73.2b)--(778.5a,234.2b);
draw (770.2a,73.2b)--(786.8a,73.2b);
draw (770.2a,234.2b)--(786.8a,234.2b);
draw (848.1a,73.2b)--(848.1a,226.2b);
draw (839.8a,73.2b)--(856.4a,73.2b);
draw (839.8a,226.2b)--(856.4a,226.2b);
draw (883.0a,73.2b)--(883.0a,234.6b);
draw (874.7a,73.2b)--(891.3a,73.2b);
draw (874.7a,234.6b)--(891.3a,234.6b);
draw (917.8a,73.2b)--(917.8a,214.3b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,214.3b)--(917.8a,214.3b);
gpdraw(2,221.2a,502.1b);
gpdraw(2,256.0a,498.8b);
gpdraw(2,290.9a,475.9b);
gpdraw(2,325.7a,457.0b);
gpdraw(2,360.5a,439.1b);
gpdraw(2,395.4a,421.7b);
gpdraw(2,430.2a,403.7b);
gpdraw(2,465.0a,385.7b);
gpdraw(2,499.8a,369.0b);
gpdraw(2,534.7a,349.7b);
gpdraw(2,569.5a,337.5b);
gpdraw(2,604.3a,327.5b);
gpdraw(2,639.2a,310.1b);
gpdraw(2,674.0a,291.5b);
gpdraw(2,708.8a,276.4b);
gpdraw(2,743.7a,254.5b);
gpdraw(2,778.5a,150.4b);
gpdraw(2,848.1a,84.4b);
gpdraw(2,883.0a,194.7b);
gpdraw(2,917.8a,111.0b);
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
draw (221.2a,459.2b)--(221.2a,459.7b);
draw (221.2a,459.2b)--(229.5a,459.2b);
draw (221.2a,459.7b)--(229.5a,459.7b);
draw (256.0a,475.1b)--(256.0a,475.4b);
draw (247.7a,475.1b)--(264.3a,475.1b);
draw (247.7a,475.4b)--(264.3a,475.4b);
draw (290.9a,441.2b)--(290.9a,441.8b);
draw (282.6a,441.2b)--(299.2a,441.2b);
draw (282.6a,441.8b)--(299.2a,441.8b);
draw (325.7a,413.5b)--(325.7a,414.6b);
draw (317.4a,413.5b)--(334.0a,413.5b);
draw (317.4a,414.6b)--(334.0a,414.6b);
draw (360.5a,387.4b)--(360.5a,389.1b);
draw (352.2a,387.4b)--(368.8a,387.4b);
draw (352.2a,389.1b)--(368.8a,389.1b);
draw (395.4a,361.9b)--(395.4a,365.0b);
draw (387.1a,361.9b)--(403.7a,361.9b);
draw (387.1a,365.0b)--(403.7a,365.0b);
draw (430.2a,333.7b)--(430.2a,338.8b);
draw (421.9a,333.7b)--(438.5a,333.7b);
draw (421.9a,338.8b)--(438.5a,338.8b);
draw (465.0a,310.3b)--(465.0a,318.8b);
draw (456.7a,310.3b)--(473.3a,310.3b);
draw (456.7a,318.8b)--(473.3a,318.8b);
draw (499.8a,291.8b)--(499.8a,303.3b);
draw (491.5a,291.8b)--(508.1a,291.8b);
draw (491.5a,303.3b)--(508.1a,303.3b);
draw (534.7a,270.6b)--(534.7a,287.2b);
draw (526.4a,270.6b)--(543.0a,270.6b);
draw (526.4a,287.2b)--(543.0a,287.2b);
draw (569.5a,245.7b)--(569.5a,271.9b);
draw (561.2a,245.7b)--(577.8a,245.7b);
draw (561.2a,271.9b)--(577.8a,271.9b);
draw (604.3a,199.5b)--(604.3a,256.4b);
draw (596.0a,199.5b)--(612.6a,199.5b);
draw (596.0a,256.4b)--(612.6a,256.4b);
draw (639.2a,73.2b)--(639.2a,230.3b);
draw (630.9a,73.2b)--(647.5a,73.2b);
draw (630.9a,230.3b)--(647.5a,230.3b);
draw (674.0a,73.2b)--(674.0a,213.8b);
draw (665.7a,73.2b)--(682.3a,73.2b);
draw (665.7a,213.8b)--(682.3a,213.8b);
draw (813.3a,73.2b)--(813.3a,208.2b);
draw (805.0a,73.2b)--(821.6a,73.2b);
draw (805.0a,208.2b)--(821.6a,208.2b);
draw (848.1a,73.2b)--(848.1a,204.2b);
draw (839.8a,73.2b)--(856.4a,73.2b);
draw (839.8a,204.2b)--(856.4a,204.2b);
draw (883.0a,73.2b)--(883.0a,198.3b);
draw (874.7a,73.2b)--(891.3a,73.2b);
draw (874.7a,198.3b)--(891.3a,198.3b);
draw (917.8a,73.2b)--(917.8a,195.6b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,195.6b)--(917.8a,195.6b);
gpdraw(3,221.2a,459.4b);
gpdraw(3,256.0a,475.2b);
gpdraw(3,290.9a,441.5b);
gpdraw(3,325.7a,414.0b);
gpdraw(3,360.5a,388.3b);
gpdraw(3,395.4a,363.5b);
gpdraw(3,430.2a,336.4b);
gpdraw(3,465.0a,314.8b);
gpdraw(3,499.8a,298.0b);
gpdraw(3,534.7a,279.9b);
gpdraw(3,569.5a,261.3b);
gpdraw(3,604.3a,238.8b);
gpdraw(3,639.2a,191.8b);
gpdraw(3,674.0a,125.3b);
gpdraw(3,813.3a,172.6b);
gpdraw(3,848.1a,164.0b);
gpdraw(3,883.0a,154.8b);
gpdraw(3,917.8a,156.3b);
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
draw (256.0a,453.8b)--(256.0a,454.1b);
draw (247.7a,453.8b)--(264.3a,453.8b);
draw (247.7a,454.1b)--(264.3a,454.1b);
draw (290.9a,409.1b)--(290.9a,410.0b);
draw (282.6a,409.1b)--(299.2a,409.1b);
draw (282.6a,410.0b)--(299.2a,410.0b);
draw (325.7a,372.6b)--(325.7a,374.3b);
draw (317.4a,372.6b)--(334.0a,372.6b);
draw (317.4a,374.3b)--(334.0a,374.3b);
draw (360.5a,340.1b)--(360.5a,343.9b);
draw (352.2a,340.1b)--(368.8a,340.1b);
draw (352.2a,343.9b)--(368.8a,343.9b);
draw (395.4a,303.9b)--(395.4a,312.7b);
draw (387.1a,303.9b)--(403.7a,303.9b);
draw (387.1a,312.7b)--(403.7a,312.7b);
draw (430.2a,260.3b)--(430.2a,281.4b);
draw (421.9a,260.3b)--(438.5a,260.3b);
draw (421.9a,281.4b)--(438.5a,281.4b);
draw (465.0a,224.3b)--(465.0a,264.0b);
draw (456.7a,224.3b)--(473.3a,224.3b);
draw (456.7a,264.0b)--(473.3a,264.0b);
draw (499.8a,118.4b)--(499.8a,247.5b);
draw (491.5a,118.4b)--(508.1a,118.4b);
draw (491.5a,247.5b)--(508.1a,247.5b);
draw (534.7a,225.2b)--(534.7a,259.6b);
draw (526.4a,225.2b)--(543.0a,225.2b);
draw (526.4a,259.6b)--(543.0a,259.6b);
draw (569.5a,73.2b)--(569.5a,236.4b);
draw (561.2a,73.2b)--(577.8a,73.2b);
draw (561.2a,236.4b)--(577.8a,236.4b);
draw (604.3a,73.2b)--(604.3a,223.0b);
draw (596.0a,73.2b)--(612.6a,73.2b);
draw (596.0a,223.0b)--(612.6a,223.0b);
draw (639.2a,73.2b)--(639.2a,213.9b);
draw (630.9a,73.2b)--(647.5a,73.2b);
draw (630.9a,213.9b)--(647.5a,213.9b);
draw (674.0a,73.2b)--(674.0a,214.5b);
draw (665.7a,73.2b)--(682.3a,73.2b);
draw (665.7a,214.5b)--(682.3a,214.5b);
draw (708.8a,73.2b)--(708.8a,201.1b);
draw (700.5a,73.2b)--(717.1a,73.2b);
draw (700.5a,201.1b)--(717.1a,201.1b);
draw (743.7a,73.2b)--(743.7a,206.9b);
draw (735.4a,73.2b)--(752.0a,73.2b);
draw (735.4a,206.9b)--(752.0a,206.9b);
draw (813.3a,73.2b)--(813.3a,188.2b);
draw (805.0a,73.2b)--(821.6a,73.2b);
draw (805.0a,188.2b)--(821.6a,188.2b);
draw (848.1a,73.2b)--(848.1a,198.9b);
draw (839.8a,73.2b)--(856.4a,73.2b);
draw (839.8a,198.9b)--(856.4a,198.9b);
draw (917.8a,136.5b)--(917.8a,199.1b);
draw (909.5a,136.5b)--(917.8a,136.5b);
draw (909.5a,199.1b)--(917.8a,199.1b);
gpdraw(4,256.0a,454.0b);
gpdraw(4,290.9a,409.5b);
gpdraw(4,325.7a,373.4b);
gpdraw(4,360.5a,342.1b);
gpdraw(4,395.4a,308.6b);
gpdraw(4,430.2a,272.5b);
gpdraw(4,465.0a,249.8b);
gpdraw(4,499.8a,225.1b);
gpdraw(4,534.7a,246.6b);
gpdraw(4,569.5a,207.1b);
gpdraw(4,604.3a,173.1b);
gpdraw(4,639.2a,160.5b);
gpdraw(4,674.0a,180.3b);
gpdraw(4,708.8a,136.7b);
gpdraw(4,743.7a,171.8b);
gpdraw(4,813.3a,121.3b);
gpdraw(4,848.1a,164.7b);
gpdraw(4,917.8a,180.8b);
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
