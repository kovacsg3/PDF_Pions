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
draw (168.1a,73.2b)--(184.7a,73.2b);
draw (917.8a,73.2b)--(901.2a,73.2b);
put_text( btex $1\times10^{-13}$ etex, 150.4a, 73.2b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,96.3b)--(176.4a,96.3b);
draw (917.8a,96.3b)--(909.5a,96.3b);
draw (168.1a,109.8b)--(176.4a,109.8b);
draw (917.8a,109.8b)--(909.5a,109.8b);
draw (168.1a,119.4b)--(176.4a,119.4b);
draw (917.8a,119.4b)--(909.5a,119.4b);
draw (168.1a,126.8b)--(176.4a,126.8b);
draw (917.8a,126.8b)--(909.5a,126.8b);
draw (168.1a,132.9b)--(176.4a,132.9b);
draw (917.8a,132.9b)--(909.5a,132.9b);
draw (168.1a,138.0b)--(176.4a,138.0b);
draw (917.8a,138.0b)--(909.5a,138.0b);
draw (168.1a,142.5b)--(176.4a,142.5b);
draw (917.8a,142.5b)--(909.5a,142.5b);
draw (168.1a,146.4b)--(176.4a,146.4b);
draw (917.8a,146.4b)--(909.5a,146.4b);
draw (168.1a,149.9b)--(184.7a,149.9b);
draw (917.8a,149.9b)--(901.2a,149.9b);
put_text( btex $1\times10^{-12}$ etex, 150.4a, 149.9b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,173.0b)--(176.4a,173.0b);
draw (917.8a,173.0b)--(909.5a,173.0b);
draw (168.1a,186.5b)--(176.4a,186.5b);
draw (917.8a,186.5b)--(909.5a,186.5b);
draw (168.1a,196.1b)--(176.4a,196.1b);
draw (917.8a,196.1b)--(909.5a,196.1b);
draw (168.1a,203.5b)--(176.4a,203.5b);
draw (917.8a,203.5b)--(909.5a,203.5b);
draw (168.1a,209.6b)--(176.4a,209.6b);
draw (917.8a,209.6b)--(909.5a,209.6b);
draw (168.1a,214.7b)--(176.4a,214.7b);
draw (917.8a,214.7b)--(909.5a,214.7b);
draw (168.1a,219.2b)--(176.4a,219.2b);
draw (917.8a,219.2b)--(909.5a,219.2b);
draw (168.1a,223.1b)--(176.4a,223.1b);
draw (917.8a,223.1b)--(909.5a,223.1b);
draw (168.1a,226.6b)--(184.7a,226.6b);
draw (917.8a,226.6b)--(901.2a,226.6b);
put_text( btex $1\times10^{-11}$ etex, 150.4a, 226.6b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,249.7b)--(176.4a,249.7b);
draw (917.8a,249.7b)--(909.5a,249.7b);
draw (168.1a,263.2b)--(176.4a,263.2b);
draw (917.8a,263.2b)--(909.5a,263.2b);
draw (168.1a,272.8b)--(176.4a,272.8b);
draw (917.8a,272.8b)--(909.5a,272.8b);
draw (168.1a,280.2b)--(176.4a,280.2b);
draw (917.8a,280.2b)--(909.5a,280.2b);
draw (168.1a,286.3b)--(176.4a,286.3b);
draw (917.8a,286.3b)--(909.5a,286.3b);
draw (168.1a,291.4b)--(176.4a,291.4b);
draw (917.8a,291.4b)--(909.5a,291.4b);
draw (168.1a,295.9b)--(176.4a,295.9b);
draw (917.8a,295.9b)--(909.5a,295.9b);
draw (168.1a,299.8b)--(176.4a,299.8b);
draw (917.8a,299.8b)--(909.5a,299.8b);
draw (168.1a,303.3b)--(184.7a,303.3b);
draw (917.8a,303.3b)--(901.2a,303.3b);
put_text( btex $1\times10^{-10}$ etex, 150.4a, 303.3b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,326.4b)--(176.4a,326.4b);
draw (917.8a,326.4b)--(909.5a,326.4b);
draw (168.1a,339.9b)--(176.4a,339.9b);
draw (917.8a,339.9b)--(909.5a,339.9b);
draw (168.1a,349.5b)--(176.4a,349.5b);
draw (917.8a,349.5b)--(909.5a,349.5b);
draw (168.1a,356.9b)--(176.4a,356.9b);
draw (917.8a,356.9b)--(909.5a,356.9b);
draw (168.1a,363.0b)--(176.4a,363.0b);
draw (917.8a,363.0b)--(909.5a,363.0b);
draw (168.1a,368.1b)--(176.4a,368.1b);
draw (917.8a,368.1b)--(909.5a,368.1b);
draw (168.1a,372.6b)--(176.4a,372.6b);
draw (917.8a,372.6b)--(909.5a,372.6b);
draw (168.1a,376.5b)--(176.4a,376.5b);
draw (917.8a,376.5b)--(909.5a,376.5b);
draw (168.1a,380.0b)--(184.7a,380.0b);
draw (917.8a,380.0b)--(901.2a,380.0b);
put_text( btex $1\times10^{-9}$ etex, 150.4a, 380.0b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,403.1b)--(176.4a,403.1b);
draw (917.8a,403.1b)--(909.5a,403.1b);
draw (168.1a,416.6b)--(176.4a,416.6b);
draw (917.8a,416.6b)--(909.5a,416.6b);
draw (168.1a,426.2b)--(176.4a,426.2b);
draw (917.8a,426.2b)--(909.5a,426.2b);
draw (168.1a,433.6b)--(176.4a,433.6b);
draw (917.8a,433.6b)--(909.5a,433.6b);
draw (168.1a,439.7b)--(176.4a,439.7b);
draw (917.8a,439.7b)--(909.5a,439.7b);
draw (168.1a,444.8b)--(176.4a,444.8b);
draw (917.8a,444.8b)--(909.5a,444.8b);
draw (168.1a,449.3b)--(176.4a,449.3b);
draw (917.8a,449.3b)--(909.5a,449.3b);
draw (168.1a,453.2b)--(176.4a,453.2b);
draw (917.8a,453.2b)--(909.5a,453.2b);
draw (168.1a,456.7b)--(184.7a,456.7b);
draw (917.8a,456.7b)--(901.2a,456.7b);
put_text( btex $1\times10^{-8}$ etex, 150.4a, 456.7b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,479.8b)--(176.4a,479.8b);
draw (917.8a,479.8b)--(909.5a,479.8b);
draw (168.1a,493.3b)--(176.4a,493.3b);
draw (917.8a,493.3b)--(909.5a,493.3b);
draw (168.1a,502.9b)--(176.4a,502.9b);
draw (917.8a,502.9b)--(909.5a,502.9b);
draw (168.1a,510.3b)--(176.4a,510.3b);
draw (917.8a,510.3b)--(909.5a,510.3b);
draw (168.1a,516.4b)--(176.4a,516.4b);
draw (917.8a,516.4b)--(909.5a,516.4b);
draw (168.1a,521.5b)--(176.4a,521.5b);
draw (917.8a,521.5b)--(909.5a,521.5b);
draw (168.1a,526.0b)--(176.4a,526.0b);
draw (917.8a,526.0b)--(909.5a,526.0b);
draw (168.1a,529.9b)--(176.4a,529.9b);
draw (917.8a,529.9b)--(909.5a,529.9b);
draw (168.1a,533.4b)--(184.7a,533.4b);
draw (917.8a,533.4b)--(901.2a,533.4b);
put_text( btex $1\times10^{-7}$ etex, 150.4a, 533.4b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,556.5b)--(176.4a,556.5b);
draw (917.8a,556.5b)--(909.5a,556.5b);
draw (168.1a,570.0b)--(176.4a,570.0b);
draw (917.8a,570.0b)--(909.5a,570.0b);
draw (168.1a,579.6b)--(176.4a,579.6b);
draw (917.8a,579.6b)--(909.5a,579.6b);
draw (168.1a,587.0b)--(176.4a,587.0b);
draw (917.8a,587.0b)--(909.5a,587.0b);
draw (168.1a,593.1b)--(176.4a,593.1b);
draw (917.8a,593.1b)--(909.5a,593.1b);
draw (168.1a,598.2b)--(176.4a,598.2b);
draw (917.8a,598.2b)--(909.5a,598.2b);
draw (168.1a,602.7b)--(176.4a,602.7b);
draw (917.8a,602.7b)--(909.5a,602.7b);
draw (168.1a,606.6b)--(176.4a,606.6b);
draw (917.8a,606.6b)--(909.5a,606.6b);
draw (168.1a,610.1b)--(184.7a,610.1b);
draw (917.8a,610.1b)--(901.2a,610.1b);
put_text( btex $1\times10^{-6}$ etex, 150.4a, 610.1b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,73.2b)--(168.1a,89.8b);
draw (168.1a,610.1b)--(168.1a,593.5b);
put_text( btex $0$ etex, 168.1a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (355.5a,73.2b)--(355.5a,89.8b);
draw (355.5a,610.1b)--(355.5a,593.5b);
put_text( btex $5$ etex, 355.5a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (543.0a,73.2b)--(543.0a,89.8b);
draw (543.0a,610.1b)--(543.0a,593.5b);
put_text( btex $10$ etex, 543.0a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (730.4a,73.2b)--(730.4a,89.8b);
draw (730.4a,610.1b)--(730.4a,593.5b);
put_text( btex $15$ etex, 730.4a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (917.8a,73.2b)--(917.8a,89.8b);
draw (917.8a,610.1b)--(917.8a,593.5b);
put_text( btex $20$ etex, 917.8a, 36.6b, 0, 2);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,610.1b)--(168.1a,73.2b)--(917.8a,73.2b)--(917.8a,610.1b)--(168.1a,610.1b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
put_text( btex proton-corr etex, 542.9a, 665.0b, 0, 2);
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
draw (168.1a,546.9b)--(168.1a,547.8b);
draw (168.1a,546.9b)--(176.4a,546.9b);
draw (168.1a,547.8b)--(176.4a,547.8b);
draw (205.6a,594.1b)--(205.6a,594.8b);
draw (197.3a,594.1b)--(213.9a,594.1b);
draw (197.3a,594.8b)--(213.9a,594.8b);
draw (243.1a,556.0b)--(243.1a,556.9b);
draw (234.8a,556.0b)--(251.4a,556.0b);
draw (234.8a,556.9b)--(251.4a,556.9b);
draw (280.6a,533.0b)--(280.6a,534.1b);
draw (272.3a,533.0b)--(288.9a,533.0b);
draw (272.3a,534.1b)--(288.9a,534.1b);
draw (318.0a,511.3b)--(318.0a,512.4b);
draw (309.7a,511.3b)--(326.3a,511.3b);
draw (309.7a,512.4b)--(326.3a,512.4b);
draw (355.5a,490.8b)--(355.5a,492.0b);
draw (347.2a,490.8b)--(363.8a,490.8b);
draw (347.2a,492.0b)--(363.8a,492.0b);
draw (393.0a,471.1b)--(393.0a,472.7b);
draw (384.7a,471.1b)--(401.3a,471.1b);
draw (384.7a,472.7b)--(401.3a,472.7b);
draw (430.5a,451.3b)--(430.5a,453.7b);
draw (422.2a,451.3b)--(438.8a,451.3b);
draw (422.2a,453.7b)--(438.8a,453.7b);
draw (468.0a,432.4b)--(468.0a,434.9b);
draw (459.7a,432.4b)--(476.3a,432.4b);
draw (459.7a,434.9b)--(476.3a,434.9b);
draw (505.5a,413.6b)--(505.5a,416.2b);
draw (497.2a,413.6b)--(513.8a,413.6b);
draw (497.2a,416.2b)--(513.8a,416.2b);
draw (543.0a,394.6b)--(543.0a,398.5b);
draw (534.7a,394.6b)--(551.3a,394.6b);
draw (534.7a,398.5b)--(551.3a,398.5b);
draw (580.4a,374.5b)--(580.4a,380.0b);
draw (572.1a,374.5b)--(588.7a,374.5b);
draw (572.1a,380.0b)--(588.7a,380.0b);
draw (617.9a,357.6b)--(617.9a,364.5b);
draw (609.6a,357.6b)--(626.2a,357.6b);
draw (609.6a,364.5b)--(626.2a,364.5b);
draw (655.4a,340.0b)--(655.4a,348.0b);
draw (647.1a,340.0b)--(663.7a,340.0b);
draw (647.1a,348.0b)--(663.7a,348.0b);
draw (692.9a,318.5b)--(692.9a,330.3b);
draw (684.6a,318.5b)--(701.2a,318.5b);
draw (684.6a,330.3b)--(701.2a,330.3b);
draw (730.4a,294.3b)--(730.4a,315.4b);
draw (722.1a,294.3b)--(738.7a,294.3b);
draw (722.1a,315.4b)--(738.7a,315.4b);
draw (767.9a,283.3b)--(767.9a,306.4b);
draw (759.6a,283.3b)--(776.2a,283.3b);
draw (759.6a,306.4b)--(776.2a,306.4b);
draw (805.3a,248.7b)--(805.3a,287.5b);
draw (797.0a,248.7b)--(813.6a,248.7b);
draw (797.0a,287.5b)--(813.6a,287.5b);
draw (842.8a,239.9b)--(842.8a,277.5b);
draw (834.5a,239.9b)--(851.1a,239.9b);
draw (834.5a,277.5b)--(851.1a,277.5b);
draw (880.3a,219.0b)--(880.3a,275.2b);
draw (872.0a,219.0b)--(888.6a,219.0b);
draw (872.0a,275.2b)--(888.6a,275.2b);
draw (917.8a,73.2b)--(917.8a,260.0b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,260.0b)--(917.8a,260.0b);
gpdraw(0,168.1a,547.4b);
gpdraw(0,205.6a,594.5b);
gpdraw(0,243.1a,556.5b);
gpdraw(0,280.6a,533.6b);
gpdraw(0,318.0a,511.8b);
gpdraw(0,355.5a,491.4b);
gpdraw(0,393.0a,471.9b);
gpdraw(0,430.5a,452.5b);
gpdraw(0,468.0a,433.7b);
gpdraw(0,505.5a,415.0b);
gpdraw(0,543.0a,396.6b);
gpdraw(0,580.4a,377.4b);
gpdraw(0,617.9a,361.3b);
gpdraw(0,655.4a,344.2b);
gpdraw(0,692.9a,324.9b);
gpdraw(0,730.4a,306.5b);
gpdraw(0,767.9a,296.9b);
gpdraw(0,805.3a,273.5b);
gpdraw(0,842.8a,263.7b);
gpdraw(0,880.3a,257.7b);
gpdraw(0,917.8a,228.3b);
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
draw (168.1a,543.6b)--(168.1a,544.7b);
draw (168.1a,543.6b)--(176.4a,543.6b);
draw (168.1a,544.7b)--(176.4a,544.7b);
draw (205.6a,592.6b)--(205.6a,593.3b);
draw (197.3a,592.6b)--(213.9a,592.6b);
draw (197.3a,593.3b)--(213.9a,593.3b);
draw (243.1a,553.8b)--(243.1a,554.7b);
draw (234.8a,553.8b)--(251.4a,553.8b);
draw (234.8a,554.7b)--(251.4a,554.7b);
draw (280.6a,530.2b)--(280.6a,531.3b);
draw (272.3a,530.2b)--(288.9a,530.2b);
draw (272.3a,531.3b)--(288.9a,531.3b);
draw (318.0a,508.1b)--(318.0a,509.2b);
draw (309.7a,508.1b)--(326.3a,508.1b);
draw (309.7a,509.2b)--(326.3a,509.2b);
draw (355.5a,487.1b)--(355.5a,488.3b);
draw (347.2a,487.1b)--(363.8a,487.1b);
draw (347.2a,488.3b)--(363.8a,488.3b);
draw (393.0a,466.7b)--(393.0a,468.2b);
draw (384.7a,466.7b)--(401.3a,466.7b);
draw (384.7a,468.2b)--(401.3a,468.2b);
draw (430.5a,446.5b)--(430.5a,448.8b);
draw (422.2a,446.5b)--(438.8a,446.5b);
draw (422.2a,448.8b)--(438.8a,448.8b);
draw (468.0a,426.6b)--(468.0a,429.1b);
draw (459.7a,426.6b)--(476.3a,426.6b);
draw (459.7a,429.1b)--(476.3a,429.1b);
draw (505.5a,407.0b)--(505.5a,409.8b);
draw (497.2a,407.0b)--(513.8a,407.0b);
draw (497.2a,409.8b)--(513.8a,409.8b);
draw (543.0a,387.0b)--(543.0a,390.9b);
draw (534.7a,387.0b)--(551.3a,387.0b);
draw (534.7a,390.9b)--(551.3a,390.9b);
draw (580.4a,366.6b)--(580.4a,372.4b);
draw (572.1a,366.6b)--(588.7a,366.6b);
draw (572.1a,372.4b)--(588.7a,372.4b);
draw (617.9a,349.1b)--(617.9a,358.1b);
draw (609.6a,349.1b)--(626.2a,349.1b);
draw (609.6a,358.1b)--(626.2a,358.1b);
draw (655.4a,331.4b)--(655.4a,343.3b);
draw (647.1a,331.4b)--(663.7a,331.4b);
draw (647.1a,343.3b)--(663.7a,343.3b);
draw (692.9a,303.2b)--(692.9a,323.0b);
draw (684.6a,303.2b)--(701.2a,303.2b);
draw (684.6a,323.0b)--(701.2a,323.0b);
draw (730.4a,273.0b)--(730.4a,300.5b);
draw (722.1a,273.0b)--(738.7a,273.0b);
draw (722.1a,300.5b)--(738.7a,300.5b);
draw (767.9a,240.1b)--(767.9a,283.6b);
draw (759.6a,240.1b)--(776.2a,240.1b);
draw (759.6a,283.6b)--(776.2a,283.6b);
draw (805.3a,176.0b)--(805.3a,278.3b);
draw (797.0a,176.0b)--(813.6a,176.0b);
draw (797.0a,278.3b)--(813.6a,278.3b);
draw (842.8a,73.2b)--(842.8a,258.4b);
draw (834.5a,73.2b)--(851.1a,73.2b);
draw (834.5a,258.4b)--(851.1a,258.4b);
draw (880.3a,73.2b)--(880.3a,262.9b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,262.9b)--(888.6a,262.9b);
gpdraw(1,168.1a,544.2b);
gpdraw(1,205.6a,592.9b);
gpdraw(1,243.1a,554.2b);
gpdraw(1,280.6a,530.8b);
gpdraw(1,318.0a,508.6b);
gpdraw(1,355.5a,487.7b);
gpdraw(1,393.0a,467.5b);
gpdraw(1,430.5a,447.7b);
gpdraw(1,468.0a,427.9b);
gpdraw(1,505.5a,408.4b);
gpdraw(1,543.0a,389.0b);
gpdraw(1,580.4a,369.6b);
gpdraw(1,617.9a,353.9b);
gpdraw(1,655.4a,337.9b);
gpdraw(1,692.9a,314.6b);
gpdraw(1,730.4a,289.5b);
gpdraw(1,767.9a,268.5b);
gpdraw(1,805.3a,256.7b);
gpdraw(1,842.8a,202.5b);
gpdraw(1,880.3a,229.8b);
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
draw (168.1a,533.2b)--(168.1a,534.5b);
draw (168.1a,533.2b)--(176.4a,533.2b);
draw (168.1a,534.5b)--(176.4a,534.5b);
draw (205.6a,588.0b)--(205.6a,588.7b);
draw (197.3a,588.0b)--(213.9a,588.0b);
draw (197.3a,588.7b)--(213.9a,588.7b);
draw (243.1a,547.0b)--(243.1a,548.0b);
draw (234.8a,547.0b)--(251.4a,547.0b);
draw (234.8a,548.0b)--(251.4a,548.0b);
draw (280.6a,522.0b)--(280.6a,523.1b);
draw (272.3a,522.0b)--(288.9a,522.0b);
draw (272.3a,523.1b)--(288.9a,523.1b);
draw (318.0a,498.5b)--(318.0a,499.5b);
draw (309.7a,498.5b)--(326.3a,498.5b);
draw (309.7a,499.5b)--(326.3a,499.5b);
draw (355.5a,476.0b)--(355.5a,477.3b);
draw (347.2a,476.0b)--(363.8a,476.0b);
draw (347.2a,477.3b)--(363.8a,477.3b);
draw (393.0a,454.0b)--(393.0a,455.6b);
draw (384.7a,454.0b)--(401.3a,454.0b);
draw (384.7a,455.6b)--(401.3a,455.6b);
draw (430.5a,432.6b)--(430.5a,434.5b);
draw (422.2a,432.6b)--(438.8a,432.6b);
draw (422.2a,434.5b)--(438.8a,434.5b);
draw (468.0a,410.4b)--(468.0a,413.2b);
draw (459.7a,410.4b)--(476.3a,410.4b);
draw (459.7a,413.2b)--(476.3a,413.2b);
draw (505.5a,388.7b)--(505.5a,393.2b);
draw (497.2a,388.7b)--(513.8a,388.7b);
draw (497.2a,393.2b)--(513.8a,393.2b);
draw (543.0a,366.1b)--(543.0a,372.0b);
draw (534.7a,366.1b)--(551.3a,366.1b);
draw (534.7a,372.0b)--(551.3a,372.0b);
draw (580.4a,340.5b)--(580.4a,349.6b);
draw (572.1a,340.5b)--(588.7a,340.5b);
draw (572.1a,349.6b)--(588.7a,349.6b);
draw (617.9a,311.8b)--(617.9a,328.2b);
draw (609.6a,311.8b)--(626.2a,311.8b);
draw (609.6a,328.2b)--(626.2a,328.2b);
draw (655.4a,290.7b)--(655.4a,315.8b);
draw (647.1a,290.7b)--(663.7a,290.7b);
draw (647.1a,315.8b)--(663.7a,315.8b);
draw (692.9a,73.2b)--(692.9a,289.8b);
draw (684.6a,73.2b)--(701.2a,73.2b);
draw (684.6a,289.8b)--(701.2a,289.8b);
draw (730.4a,73.2b)--(730.4a,264.8b);
draw (722.1a,73.2b)--(738.7a,73.2b);
draw (722.1a,264.8b)--(738.7a,264.8b);
draw (805.3a,73.2b)--(805.3a,253.9b);
draw (797.0a,73.2b)--(813.6a,73.2b);
draw (797.0a,253.9b)--(813.6a,253.9b);
draw (842.8a,73.2b)--(842.8a,255.7b);
draw (834.5a,73.2b)--(851.1a,73.2b);
draw (834.5a,255.7b)--(851.1a,255.7b);
draw (880.3a,73.2b)--(880.3a,249.6b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,249.6b)--(888.6a,249.6b);
draw (917.8a,73.2b)--(917.8a,249.3b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,249.3b)--(917.8a,249.3b);
gpdraw(2,168.1a,533.9b);
gpdraw(2,205.6a,588.4b);
gpdraw(2,243.1a,547.5b);
gpdraw(2,280.6a,522.5b);
gpdraw(2,318.0a,499.0b);
gpdraw(2,355.5a,476.7b);
gpdraw(2,393.0a,454.8b);
gpdraw(2,430.5a,433.6b);
gpdraw(2,468.0a,411.9b);
gpdraw(2,505.5a,391.1b);
gpdraw(2,543.0a,369.2b);
gpdraw(2,580.4a,345.3b);
gpdraw(2,617.9a,321.0b);
gpdraw(2,655.4a,305.6b);
gpdraw(2,692.9a,261.5b);
gpdraw(2,730.4a,192.3b);
gpdraw(2,805.3a,189.7b);
gpdraw(2,842.8a,231.3b);
gpdraw(2,880.3a,218.9b);
gpdraw(2,917.8a,214.0b);
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
draw (168.1a,514.1b)--(168.1a,515.8b);
draw (168.1a,514.1b)--(176.4a,514.1b);
draw (168.1a,515.8b)--(176.4a,515.8b);
draw (205.6a,580.8b)--(205.6a,581.6b);
draw (197.3a,580.8b)--(213.9a,580.8b);
draw (197.3a,581.6b)--(213.9a,581.6b);
draw (243.1a,536.5b)--(243.1a,537.5b);
draw (234.8a,536.5b)--(251.4a,536.5b);
draw (234.8a,537.5b)--(251.4a,537.5b);
draw (280.6a,509.1b)--(280.6a,510.2b);
draw (272.3a,509.1b)--(288.9a,509.1b);
draw (272.3a,510.2b)--(288.9a,510.2b);
draw (318.0a,483.4b)--(318.0a,484.4b);
draw (309.7a,483.4b)--(326.3a,483.4b);
draw (309.7a,484.4b)--(326.3a,484.4b);
draw (355.5a,458.8b)--(355.5a,460.2b);
draw (347.2a,458.8b)--(363.8a,458.8b);
draw (347.2a,460.2b)--(363.8a,460.2b);
draw (393.0a,434.3b)--(393.0a,436.4b);
draw (384.7a,434.3b)--(401.3a,434.3b);
draw (384.7a,436.4b)--(401.3a,436.4b);
draw (430.5a,410.6b)--(430.5a,413.0b);
draw (422.2a,410.6b)--(438.8a,410.6b);
draw (422.2a,413.0b)--(438.8a,413.0b);
draw (468.0a,386.0b)--(468.0a,389.3b);
draw (459.7a,386.0b)--(476.3a,386.0b);
draw (459.7a,389.3b)--(476.3a,389.3b);
draw (505.5a,362.3b)--(505.5a,368.2b);
draw (497.2a,362.3b)--(513.8a,362.3b);
draw (497.2a,368.2b)--(513.8a,368.2b);
draw (543.0a,336.6b)--(543.0a,345.8b);
draw (534.7a,336.6b)--(551.3a,336.6b);
draw (534.7a,345.8b)--(551.3a,345.8b);
draw (580.4a,293.9b)--(580.4a,316.1b);
draw (572.1a,293.9b)--(588.7a,293.9b);
draw (572.1a,316.1b)--(588.7a,316.1b);
draw (617.9a,73.2b)--(617.9a,284.4b);
draw (609.6a,73.2b)--(626.2a,73.2b);
draw (609.6a,284.4b)--(626.2a,284.4b);
draw (655.4a,73.2b)--(655.4a,279.9b);
draw (647.1a,73.2b)--(663.7a,73.2b);
draw (647.1a,279.9b)--(663.7a,279.9b);
draw (842.8a,73.2b)--(842.8a,229.4b);
draw (834.5a,73.2b)--(851.1a,73.2b);
draw (834.5a,229.4b)--(851.1a,229.4b);
draw (917.8a,88.1b)--(917.8a,231.1b);
draw (909.5a,88.1b)--(917.8a,88.1b);
draw (909.5a,231.1b)--(917.8a,231.1b);
gpdraw(3,168.1a,514.9b);
gpdraw(3,205.6a,581.2b);
gpdraw(3,243.1a,537.0b);
gpdraw(3,280.6a,509.7b);
gpdraw(3,318.0a,483.9b);
gpdraw(3,355.5a,459.5b);
gpdraw(3,393.0a,435.3b);
gpdraw(3,430.5a,411.9b);
gpdraw(3,468.0a,387.7b);
gpdraw(3,505.5a,365.4b);
gpdraw(3,543.0a,341.5b);
gpdraw(3,580.4a,306.8b);
gpdraw(3,617.9a,256.7b);
gpdraw(3,655.4a,251.5b);
gpdraw(3,842.8a,165.3b);
gpdraw(3,917.8a,208.4b);
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
draw (168.1a,477.0b)--(168.1a,480.5b);
draw (168.1a,477.0b)--(176.4a,477.0b);
draw (168.1a,480.5b)--(176.4a,480.5b);
draw (205.6a,571.4b)--(205.6a,572.2b);
draw (197.3a,571.4b)--(213.9a,571.4b);
draw (197.3a,572.2b)--(213.9a,572.2b);
draw (243.1a,522.8b)--(243.1a,523.8b);
draw (234.8a,522.8b)--(251.4a,522.8b);
draw (234.8a,523.8b)--(251.4a,523.8b);
draw (280.6a,492.5b)--(280.6a,493.6b);
draw (272.3a,492.5b)--(288.9a,492.5b);
draw (272.3a,493.6b)--(288.9a,493.6b);
draw (318.0a,463.8b)--(318.0a,465.0b);
draw (309.7a,463.8b)--(326.3a,463.8b);
draw (309.7a,465.0b)--(326.3a,465.0b);
draw (355.5a,436.0b)--(355.5a,437.9b);
draw (347.2a,436.0b)--(363.8a,436.0b);
draw (347.2a,437.9b)--(363.8a,437.9b);
draw (393.0a,408.9b)--(393.0a,411.7b);
draw (384.7a,408.9b)--(401.3a,408.9b);
draw (384.7a,411.7b)--(401.3a,411.7b);
draw (430.5a,382.6b)--(430.5a,386.0b);
draw (422.2a,382.6b)--(438.8a,382.6b);
draw (422.2a,386.0b)--(438.8a,386.0b);
draw (468.0a,355.9b)--(468.0a,360.6b);
draw (459.7a,355.9b)--(476.3a,355.9b);
draw (459.7a,360.6b)--(476.3a,360.6b);
draw (505.5a,332.8b)--(505.5a,341.8b);
draw (497.2a,332.8b)--(513.8a,332.8b);
draw (497.2a,341.8b)--(513.8a,341.8b);
draw (543.0a,309.5b)--(543.0a,323.3b);
draw (534.7a,309.5b)--(551.3a,309.5b);
draw (534.7a,323.3b)--(551.3a,323.3b);
draw (580.4a,254.1b)--(580.4a,289.5b);
draw (572.1a,254.1b)--(588.7a,254.1b);
draw (572.1a,289.5b)--(588.7a,289.5b);
draw (617.9a,73.2b)--(617.9a,260.1b);
draw (609.6a,73.2b)--(626.2a,73.2b);
draw (609.6a,260.1b)--(626.2a,260.1b);
draw (655.4a,73.2b)--(655.4a,240.2b);
draw (647.1a,73.2b)--(663.7a,73.2b);
draw (647.1a,240.2b)--(663.7a,240.2b);
draw (805.3a,73.2b)--(805.3a,224.3b);
draw (797.0a,73.2b)--(813.6a,73.2b);
draw (797.0a,224.3b)--(813.6a,224.3b);
draw (880.3a,73.2b)--(880.3a,210.6b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,210.6b)--(888.6a,210.6b);
gpdraw(4,168.1a,478.8b);
gpdraw(4,205.6a,571.8b);
gpdraw(4,243.1a,523.3b);
gpdraw(4,280.6a,493.1b);
gpdraw(4,318.0a,464.4b);
gpdraw(4,355.5a,436.9b);
gpdraw(4,393.0a,410.3b);
gpdraw(4,430.5a,384.3b);
gpdraw(4,468.0a,358.3b);
gpdraw(4,505.5a,337.6b);
gpdraw(4,543.0a,317.1b);
gpdraw(4,580.4a,276.3b);
gpdraw(4,617.9a,218.8b);
gpdraw(4,655.4a,159.9b);
gpdraw(4,805.3a,160.9b);
gpdraw(4,880.3a,164.9b);
gpdraw(4,1120.8a,445.4b);
scalepen 2.000;
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
scalepen 1.000;
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,610.1b)--(168.1a,73.2b)--(917.8a,73.2b)--(917.8a,610.1b)--(168.1a,610.1b);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
endfig;
% BEGPOST
verbatimtex
 \end{document}
etex
% ENDPOST
end.
