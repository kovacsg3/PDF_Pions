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
draw (168.1a,73.2b)--(184.7a,73.2b);
draw (917.8a,73.2b)--(901.2a,73.2b);
put_text( btex $1\times10^{-13}$ etex, 150.4a, 73.2b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,93.4b)--(176.4a,93.4b);
draw (917.8a,93.4b)--(909.5a,93.4b);
draw (168.1a,105.2b)--(176.4a,105.2b);
draw (917.8a,105.2b)--(909.5a,105.2b);
draw (168.1a,113.6b)--(176.4a,113.6b);
draw (917.8a,113.6b)--(909.5a,113.6b);
draw (168.1a,120.1b)--(176.4a,120.1b);
draw (917.8a,120.1b)--(909.5a,120.1b);
draw (168.1a,125.4b)--(176.4a,125.4b);
draw (917.8a,125.4b)--(909.5a,125.4b);
draw (168.1a,129.9b)--(176.4a,129.9b);
draw (917.8a,129.9b)--(909.5a,129.9b);
draw (168.1a,133.8b)--(176.4a,133.8b);
draw (917.8a,133.8b)--(909.5a,133.8b);
draw (168.1a,137.2b)--(176.4a,137.2b);
draw (917.8a,137.2b)--(909.5a,137.2b);
draw (168.1a,140.3b)--(184.7a,140.3b);
draw (917.8a,140.3b)--(901.2a,140.3b);
put_text( btex $1\times10^{-12}$ etex, 150.4a, 140.3b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,160.5b)--(176.4a,160.5b);
draw (917.8a,160.5b)--(909.5a,160.5b);
draw (168.1a,172.3b)--(176.4a,172.3b);
draw (917.8a,172.3b)--(909.5a,172.3b);
draw (168.1a,180.7b)--(176.4a,180.7b);
draw (917.8a,180.7b)--(909.5a,180.7b);
draw (168.1a,187.2b)--(176.4a,187.2b);
draw (917.8a,187.2b)--(909.5a,187.2b);
draw (168.1a,192.5b)--(176.4a,192.5b);
draw (917.8a,192.5b)--(909.5a,192.5b);
draw (168.1a,197.0b)--(176.4a,197.0b);
draw (917.8a,197.0b)--(909.5a,197.0b);
draw (168.1a,200.9b)--(176.4a,200.9b);
draw (917.8a,200.9b)--(909.5a,200.9b);
draw (168.1a,204.4b)--(176.4a,204.4b);
draw (917.8a,204.4b)--(909.5a,204.4b);
draw (168.1a,207.4b)--(184.7a,207.4b);
draw (917.8a,207.4b)--(901.2a,207.4b);
put_text( btex $1\times10^{-11}$ etex, 150.4a, 207.4b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,227.6b)--(176.4a,227.6b);
draw (917.8a,227.6b)--(909.5a,227.6b);
draw (168.1a,239.4b)--(176.4a,239.4b);
draw (917.8a,239.4b)--(909.5a,239.4b);
draw (168.1a,247.8b)--(176.4a,247.8b);
draw (917.8a,247.8b)--(909.5a,247.8b);
draw (168.1a,254.3b)--(176.4a,254.3b);
draw (917.8a,254.3b)--(909.5a,254.3b);
draw (168.1a,259.6b)--(176.4a,259.6b);
draw (917.8a,259.6b)--(909.5a,259.6b);
draw (168.1a,264.1b)--(176.4a,264.1b);
draw (917.8a,264.1b)--(909.5a,264.1b);
draw (168.1a,268.0b)--(176.4a,268.0b);
draw (917.8a,268.0b)--(909.5a,268.0b);
draw (168.1a,271.5b)--(176.4a,271.5b);
draw (917.8a,271.5b)--(909.5a,271.5b);
draw (168.1a,274.5b)--(184.7a,274.5b);
draw (917.8a,274.5b)--(901.2a,274.5b);
put_text( btex $1\times10^{-10}$ etex, 150.4a, 274.5b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,294.7b)--(176.4a,294.7b);
draw (917.8a,294.7b)--(909.5a,294.7b);
draw (168.1a,306.6b)--(176.4a,306.6b);
draw (917.8a,306.6b)--(909.5a,306.6b);
draw (168.1a,314.9b)--(176.4a,314.9b);
draw (917.8a,314.9b)--(909.5a,314.9b);
draw (168.1a,321.4b)--(176.4a,321.4b);
draw (917.8a,321.4b)--(909.5a,321.4b);
draw (168.1a,326.8b)--(176.4a,326.8b);
draw (917.8a,326.8b)--(909.5a,326.8b);
draw (168.1a,331.3b)--(176.4a,331.3b);
draw (917.8a,331.3b)--(909.5a,331.3b);
draw (168.1a,335.1b)--(176.4a,335.1b);
draw (917.8a,335.1b)--(909.5a,335.1b);
draw (168.1a,338.6b)--(176.4a,338.6b);
draw (917.8a,338.6b)--(909.5a,338.6b);
draw (168.1a,341.7b)--(184.7a,341.7b);
draw (917.8a,341.7b)--(901.2a,341.7b);
put_text( btex $1\times10^{-9}$ etex, 150.4a, 341.7b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,361.9b)--(176.4a,361.9b);
draw (917.8a,361.9b)--(909.5a,361.9b);
draw (168.1a,373.7b)--(176.4a,373.7b);
draw (917.8a,373.7b)--(909.5a,373.7b);
draw (168.1a,382.1b)--(176.4a,382.1b);
draw (917.8a,382.1b)--(909.5a,382.1b);
draw (168.1a,388.6b)--(176.4a,388.6b);
draw (917.8a,388.6b)--(909.5a,388.6b);
draw (168.1a,393.9b)--(176.4a,393.9b);
draw (917.8a,393.9b)--(909.5a,393.9b);
draw (168.1a,398.4b)--(176.4a,398.4b);
draw (917.8a,398.4b)--(909.5a,398.4b);
draw (168.1a,402.3b)--(176.4a,402.3b);
draw (917.8a,402.3b)--(909.5a,402.3b);
draw (168.1a,405.7b)--(176.4a,405.7b);
draw (917.8a,405.7b)--(909.5a,405.7b);
draw (168.1a,408.8b)--(184.7a,408.8b);
draw (917.8a,408.8b)--(901.2a,408.8b);
put_text( btex $1\times10^{-8}$ etex, 150.4a, 408.8b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,429.0b)--(176.4a,429.0b);
draw (917.8a,429.0b)--(909.5a,429.0b);
draw (168.1a,440.8b)--(176.4a,440.8b);
draw (917.8a,440.8b)--(909.5a,440.8b);
draw (168.1a,449.2b)--(176.4a,449.2b);
draw (917.8a,449.2b)--(909.5a,449.2b);
draw (168.1a,455.7b)--(176.4a,455.7b);
draw (917.8a,455.7b)--(909.5a,455.7b);
draw (168.1a,461.0b)--(176.4a,461.0b);
draw (917.8a,461.0b)--(909.5a,461.0b);
draw (168.1a,465.5b)--(176.4a,465.5b);
draw (917.8a,465.5b)--(909.5a,465.5b);
draw (168.1a,469.4b)--(176.4a,469.4b);
draw (917.8a,469.4b)--(909.5a,469.4b);
draw (168.1a,472.8b)--(176.4a,472.8b);
draw (917.8a,472.8b)--(909.5a,472.8b);
draw (168.1a,475.9b)--(184.7a,475.9b);
draw (917.8a,475.9b)--(901.2a,475.9b);
put_text( btex $1\times10^{-7}$ etex, 150.4a, 475.9b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,496.1b)--(176.4a,496.1b);
draw (917.8a,496.1b)--(909.5a,496.1b);
draw (168.1a,507.9b)--(176.4a,507.9b);
draw (917.8a,507.9b)--(909.5a,507.9b);
draw (168.1a,516.3b)--(176.4a,516.3b);
draw (917.8a,516.3b)--(909.5a,516.3b);
draw (168.1a,522.8b)--(176.4a,522.8b);
draw (917.8a,522.8b)--(909.5a,522.8b);
draw (168.1a,528.1b)--(176.4a,528.1b);
draw (917.8a,528.1b)--(909.5a,528.1b);
draw (168.1a,532.6b)--(176.4a,532.6b);
draw (917.8a,532.6b)--(909.5a,532.6b);
draw (168.1a,536.5b)--(176.4a,536.5b);
draw (917.8a,536.5b)--(909.5a,536.5b);
draw (168.1a,539.9b)--(176.4a,539.9b);
draw (917.8a,539.9b)--(909.5a,539.9b);
draw (168.1a,543.0b)--(184.7a,543.0b);
draw (917.8a,543.0b)--(901.2a,543.0b);
put_text( btex $1\times10^{-6}$ etex, 150.4a, 543.0b, 0, 3);
linetype -2;
%MP_dashtype% DASHTYPE_SOLID
draw (168.1a,563.2b)--(176.4a,563.2b);
draw (917.8a,563.2b)--(909.5a,563.2b);
draw (168.1a,575.0b)--(176.4a,575.0b);
draw (917.8a,575.0b)--(909.5a,575.0b);
draw (168.1a,583.4b)--(176.4a,583.4b);
draw (917.8a,583.4b)--(909.5a,583.4b);
draw (168.1a,589.9b)--(176.4a,589.9b);
draw (917.8a,589.9b)--(909.5a,589.9b);
draw (168.1a,595.2b)--(176.4a,595.2b);
draw (917.8a,595.2b)--(909.5a,595.2b);
draw (168.1a,599.7b)--(176.4a,599.7b);
draw (917.8a,599.7b)--(909.5a,599.7b);
draw (168.1a,603.6b)--(176.4a,603.6b);
draw (917.8a,603.6b)--(909.5a,603.6b);
draw (168.1a,607.0b)--(176.4a,607.0b);
draw (917.8a,607.0b)--(909.5a,607.0b);
draw (168.1a,610.1b)--(184.7a,610.1b);
draw (917.8a,610.1b)--(901.2a,610.1b);
put_text( btex $1\times10^{-5}$ etex, 150.4a, 610.1b, 0, 3);
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
draw (168.1a,582.5b)--(168.1a,582.8b);
draw (168.1a,582.5b)--(176.4a,582.5b);
draw (168.1a,582.8b)--(176.4a,582.8b);
draw (205.6a,599.8b)--(205.6a,600.0b);
draw (197.3a,599.8b)--(213.9a,599.8b);
draw (197.3a,600.0b)--(213.9a,600.0b);
draw (243.1a,562.1b)--(243.1a,562.5b);
draw (234.8a,562.1b)--(251.4a,562.1b);
draw (234.8a,562.5b)--(251.4a,562.5b);
draw (280.6a,531.7b)--(280.6a,532.2b);
draw (272.3a,531.7b)--(288.9a,531.7b);
draw (272.3a,532.2b)--(288.9a,532.2b);
draw (318.0a,502.7b)--(318.0a,503.4b);
draw (309.7a,502.7b)--(326.3a,502.7b);
draw (309.7a,503.4b)--(326.3a,503.4b);
draw (355.5a,474.5b)--(355.5a,475.5b);
draw (347.2a,474.5b)--(363.8a,474.5b);
draw (347.2a,475.5b)--(363.8a,475.5b);
draw (393.0a,446.6b)--(393.0a,448.0b);
draw (384.7a,446.6b)--(401.3a,446.6b);
draw (384.7a,448.0b)--(401.3a,448.0b);
draw (430.5a,418.4b)--(430.5a,421.1b);
draw (422.2a,418.4b)--(438.8a,418.4b);
draw (422.2a,421.1b)--(438.8a,421.1b);
draw (468.0a,389.0b)--(468.0a,394.2b);
draw (459.7a,389.0b)--(476.3a,389.0b);
draw (459.7a,394.2b)--(476.3a,394.2b);
draw (505.5a,356.6b)--(505.5a,368.0b);
draw (497.2a,356.6b)--(513.8a,356.6b);
draw (497.2a,368.0b)--(513.8a,368.0b);
draw (543.0a,329.7b)--(543.0a,347.9b);
draw (534.7a,329.7b)--(551.3a,329.7b);
draw (534.7a,347.9b)--(551.3a,347.9b);
draw (580.4a,310.2b)--(580.4a,336.2b);
draw (572.1a,310.2b)--(588.7a,310.2b);
draw (572.1a,336.2b)--(588.7a,336.2b);
draw (617.9a,272.0b)--(617.9a,319.6b);
draw (609.6a,272.0b)--(626.2a,272.0b);
draw (609.6a,319.6b)--(626.2a,319.6b);
draw (655.4a,73.2b)--(655.4a,297.6b);
draw (647.1a,73.2b)--(663.7a,73.2b);
draw (647.1a,297.6b)--(663.7a,297.6b);
draw (692.9a,73.2b)--(692.9a,289.1b);
draw (684.6a,73.2b)--(701.2a,73.2b);
draw (684.6a,289.1b)--(701.2a,289.1b);
draw (767.9a,73.2b)--(767.9a,270.1b);
draw (759.6a,73.2b)--(776.2a,73.2b);
draw (759.6a,270.1b)--(776.2a,270.1b);
draw (880.3a,73.2b)--(880.3a,250.0b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,250.0b)--(888.6a,250.0b);
draw (917.8a,73.2b)--(917.8a,256.6b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,256.6b)--(917.8a,256.6b);
gpdraw(0,168.1a,582.6b);
gpdraw(0,205.6a,599.9b);
gpdraw(0,243.1a,562.3b);
gpdraw(0,280.6a,531.9b);
gpdraw(0,318.0a,503.1b);
gpdraw(0,355.5a,475.0b);
gpdraw(0,393.0a,447.3b);
gpdraw(0,430.5a,419.8b);
gpdraw(0,468.0a,391.7b);
gpdraw(0,505.5a,362.8b);
gpdraw(0,543.0a,340.2b);
gpdraw(0,580.4a,326.0b);
gpdraw(0,617.9a,304.6b);
gpdraw(0,655.4a,267.5b);
gpdraw(0,692.9a,255.1b);
gpdraw(0,767.9a,209.8b);
gpdraw(0,880.3a,192.0b);
gpdraw(0,917.8a,231.3b);
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
draw (168.1a,578.1b)--(168.1a,578.4b);
draw (168.1a,578.1b)--(176.4a,578.1b);
draw (168.1a,578.4b)--(176.4a,578.4b);
draw (205.6a,597.1b)--(205.6a,597.3b);
draw (197.3a,597.1b)--(213.9a,597.1b);
draw (197.3a,597.3b)--(213.9a,597.3b);
draw (243.1a,558.2b)--(243.1a,558.6b);
draw (234.8a,558.2b)--(251.4a,558.2b);
draw (234.8a,558.6b)--(251.4a,558.6b);
draw (280.6a,526.7b)--(280.6a,527.2b);
draw (272.3a,526.7b)--(288.9a,526.7b);
draw (272.3a,527.2b)--(288.9a,527.2b);
draw (318.0a,496.6b)--(318.0a,497.3b);
draw (309.7a,496.6b)--(326.3a,496.6b);
draw (309.7a,497.3b)--(326.3a,497.3b);
draw (355.5a,467.2b)--(355.5a,468.4b);
draw (347.2a,467.2b)--(363.8a,467.2b);
draw (347.2a,468.4b)--(363.8a,468.4b);
draw (393.0a,438.3b)--(393.0a,440.1b);
draw (384.7a,438.3b)--(401.3a,438.3b);
draw (384.7a,440.1b)--(401.3a,440.1b);
draw (430.5a,408.1b)--(430.5a,411.6b);
draw (422.2a,408.1b)--(438.8a,408.1b);
draw (422.2a,411.6b)--(438.8a,411.6b);
draw (468.0a,373.3b)--(468.0a,380.7b);
draw (459.7a,373.3b)--(476.3a,373.3b);
draw (459.7a,380.7b)--(476.3a,380.7b);
draw (505.5a,347.2b)--(505.5a,360.5b);
draw (497.2a,347.2b)--(513.8a,347.2b);
draw (497.2a,360.5b)--(513.8a,360.5b);
draw (543.0a,324.4b)--(543.0a,342.4b);
draw (534.7a,324.4b)--(551.3a,324.4b);
draw (534.7a,342.4b)--(551.3a,342.4b);
draw (580.4a,73.2b)--(580.4a,311.2b);
draw (572.1a,73.2b)--(588.7a,73.2b);
draw (572.1a,311.2b)--(588.7a,311.2b);
draw (617.9a,73.2b)--(617.9a,289.8b);
draw (609.6a,73.2b)--(626.2a,73.2b);
draw (609.6a,289.8b)--(626.2a,289.8b);
draw (692.9a,73.2b)--(692.9a,289.0b);
draw (684.6a,73.2b)--(701.2a,73.2b);
draw (684.6a,289.0b)--(701.2a,289.0b);
gpdraw(1,168.1a,578.3b);
gpdraw(1,205.6a,597.2b);
gpdraw(1,243.1a,558.4b);
gpdraw(1,280.6a,526.9b);
gpdraw(1,318.0a,497.0b);
gpdraw(1,355.5a,467.8b);
gpdraw(1,393.0a,439.2b);
gpdraw(1,430.5a,409.9b);
gpdraw(1,468.0a,377.3b);
gpdraw(1,505.5a,354.6b);
gpdraw(1,543.0a,334.8b);
gpdraw(1,580.4a,288.6b);
gpdraw(1,617.9a,201.9b);
gpdraw(1,692.9a,263.8b);
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
draw (168.1a,564.6b)--(168.1a,564.9b);
draw (168.1a,564.6b)--(176.4a,564.6b);
draw (168.1a,564.9b)--(176.4a,564.9b);
draw (205.6a,589.4b)--(205.6a,589.7b);
draw (197.3a,589.4b)--(213.9a,589.4b);
draw (197.3a,589.7b)--(213.9a,589.7b);
draw (243.1a,547.2b)--(243.1a,547.6b);
draw (234.8a,547.2b)--(251.4a,547.2b);
draw (234.8a,547.6b)--(251.4a,547.6b);
draw (280.6a,512.7b)--(280.6a,513.2b);
draw (272.3a,512.7b)--(288.9a,512.7b);
draw (272.3a,513.2b)--(288.9a,513.2b);
draw (318.0a,479.5b)--(318.0a,480.3b);
draw (309.7a,479.5b)--(326.3a,479.5b);
draw (309.7a,480.3b)--(326.3a,480.3b);
draw (355.5a,447.4b)--(355.5a,448.9b);
draw (347.2a,447.4b)--(363.8a,447.4b);
draw (347.2a,448.9b)--(363.8a,448.9b);
draw (393.0a,417.2b)--(393.0a,419.5b);
draw (384.7a,417.2b)--(401.3a,417.2b);
draw (384.7a,419.5b)--(401.3a,419.5b);
draw (430.5a,380.4b)--(430.5a,387.0b);
draw (422.2a,380.4b)--(438.8a,380.4b);
draw (422.2a,387.0b)--(438.8a,387.0b);
draw (468.0a,324.0b)--(468.0a,347.2b);
draw (459.7a,324.0b)--(476.3a,324.0b);
draw (459.7a,347.2b)--(476.3a,347.2b);
draw (505.5a,255.8b)--(505.5a,323.9b);
draw (497.2a,255.8b)--(513.8a,255.8b);
draw (497.2a,323.9b)--(513.8a,323.9b);
draw (580.4a,73.2b)--(580.4a,284.7b);
draw (572.1a,73.2b)--(588.7a,73.2b);
draw (572.1a,284.7b)--(588.7a,284.7b);
draw (617.9a,216.3b)--(617.9a,299.8b);
draw (609.6a,216.3b)--(626.2a,216.3b);
draw (609.6a,299.8b)--(626.2a,299.8b);
draw (655.4a,73.2b)--(655.4a,292.5b);
draw (647.1a,73.2b)--(663.7a,73.2b);
draw (647.1a,292.5b)--(663.7a,292.5b);
draw (692.9a,73.2b)--(692.9a,275.0b);
draw (684.6a,73.2b)--(701.2a,73.2b);
draw (684.6a,275.0b)--(701.2a,275.0b);
draw (730.4a,191.6b)--(730.4a,283.5b);
draw (722.1a,191.6b)--(738.7a,191.6b);
draw (722.1a,283.5b)--(738.7a,283.5b);
draw (880.3a,73.2b)--(880.3a,248.8b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,248.8b)--(888.6a,248.8b);
draw (917.8a,73.2b)--(917.8a,241.0b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,241.0b)--(917.8a,241.0b);
gpdraw(2,168.1a,564.8b);
gpdraw(2,205.6a,589.5b);
gpdraw(2,243.1a,547.4b);
gpdraw(2,280.6a,512.9b);
gpdraw(2,318.0a,479.9b);
gpdraw(2,355.5a,448.2b);
gpdraw(2,393.0a,418.4b);
gpdraw(2,430.5a,383.9b);
gpdraw(2,468.0a,337.8b);
gpdraw(2,505.5a,306.4b);
gpdraw(2,580.4a,228.7b);
gpdraw(2,617.9a,281.2b);
gpdraw(2,655.4a,271.5b);
gpdraw(2,692.9a,239.6b);
gpdraw(2,730.4a,264.5b);
gpdraw(2,880.3a,220.9b);
gpdraw(2,917.8a,205.0b);
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
draw (168.1a,538.0b)--(168.1a,538.4b);
draw (168.1a,538.0b)--(176.4a,538.0b);
draw (168.1a,538.4b)--(176.4a,538.4b);
draw (205.6a,577.7b)--(205.6a,578.0b);
draw (197.3a,577.7b)--(213.9a,577.7b);
draw (197.3a,578.0b)--(213.9a,578.0b);
draw (243.1a,530.8b)--(243.1a,531.2b);
draw (234.8a,530.8b)--(251.4a,530.8b);
draw (234.8a,531.2b)--(251.4a,531.2b);
draw (280.6a,491.9b)--(280.6a,492.5b);
draw (272.3a,491.9b)--(288.9a,491.9b);
draw (272.3a,492.5b)--(288.9a,492.5b);
draw (318.0a,454.0b)--(318.0a,455.2b);
draw (309.7a,454.0b)--(326.3a,454.0b);
draw (309.7a,455.2b)--(326.3a,455.2b);
draw (355.5a,417.2b)--(355.5a,419.4b);
draw (347.2a,417.2b)--(363.8a,417.2b);
draw (347.2a,419.4b)--(363.8a,419.4b);
draw (393.0a,384.1b)--(393.0a,388.2b);
draw (384.7a,384.1b)--(401.3a,384.1b);
draw (384.7a,388.2b)--(401.3a,388.2b);
draw (430.5a,336.8b)--(430.5a,351.6b);
draw (422.2a,336.8b)--(438.8a,336.8b);
draw (422.2a,351.6b)--(438.8a,351.6b);
draw (468.0a,73.2b)--(468.0a,302.7b);
draw (459.7a,73.2b)--(476.3a,73.2b);
draw (459.7a,302.7b)--(476.3a,302.7b);
draw (505.5a,73.2b)--(505.5a,286.1b);
draw (497.2a,73.2b)--(513.8a,73.2b);
draw (497.2a,286.1b)--(513.8a,286.1b);
draw (543.0a,73.2b)--(543.0a,287.0b);
draw (534.7a,73.2b)--(551.3a,73.2b);
draw (534.7a,287.0b)--(551.3a,287.0b);
draw (580.4a,246.4b)--(580.4a,294.7b);
draw (572.1a,246.4b)--(588.7a,246.4b);
draw (572.1a,294.7b)--(588.7a,294.7b);
draw (617.9a,73.2b)--(617.9a,270.4b);
draw (609.6a,73.2b)--(626.2a,73.2b);
draw (609.6a,270.4b)--(626.2a,270.4b);
draw (655.4a,73.2b)--(655.4a,269.6b);
draw (647.1a,73.2b)--(663.7a,73.2b);
draw (647.1a,269.6b)--(663.7a,269.6b);
draw (692.9a,73.2b)--(692.9a,256.6b);
draw (684.6a,73.2b)--(701.2a,73.2b);
draw (684.6a,256.6b)--(701.2a,256.6b);
draw (730.4a,235.9b)--(730.4a,272.3b);
draw (722.1a,235.9b)--(738.7a,235.9b);
draw (722.1a,272.3b)--(738.7a,272.3b);
draw (767.9a,73.2b)--(767.9a,249.8b);
draw (759.6a,73.2b)--(776.2a,73.2b);
draw (759.6a,249.8b)--(776.2a,249.8b);
draw (805.3a,73.2b)--(805.3a,246.6b);
draw (797.0a,73.2b)--(813.6a,73.2b);
draw (797.0a,246.6b)--(813.6a,246.6b);
draw (842.8a,124.0b)--(842.8a,245.7b);
draw (834.5a,124.0b)--(851.1a,124.0b);
draw (834.5a,245.7b)--(851.1a,245.7b);
draw (880.3a,73.2b)--(880.3a,232.2b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,232.2b)--(888.6a,232.2b);
draw (917.8a,73.2b)--(917.8a,225.9b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,225.9b)--(917.8a,225.9b);
gpdraw(3,168.1a,538.2b);
gpdraw(3,205.6a,577.9b);
gpdraw(3,243.1a,531.0b);
gpdraw(3,280.6a,492.2b);
gpdraw(3,318.0a,454.6b);
gpdraw(3,355.5a,418.3b);
gpdraw(3,393.0a,386.3b);
gpdraw(3,430.5a,345.1b);
gpdraw(3,468.0a,266.0b);
gpdraw(3,505.5a,231.0b);
gpdraw(3,543.0a,251.1b);
gpdraw(3,580.4a,279.6b);
gpdraw(3,617.9a,237.2b);
gpdraw(3,655.4a,247.5b);
gpdraw(3,692.9a,216.0b);
gpdraw(3,730.4a,259.5b);
gpdraw(3,767.9a,217.5b);
gpdraw(3,805.3a,221.6b);
gpdraw(3,842.8a,225.9b);
gpdraw(3,880.3a,203.6b);
gpdraw(3,917.8a,197.6b);
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
draw (205.6a,562.9b)--(205.6a,563.2b);
draw (197.3a,562.9b)--(213.9a,562.9b);
draw (197.3a,563.2b)--(213.9a,563.2b);
draw (243.1a,510.2b)--(243.1a,510.7b);
draw (234.8a,510.2b)--(251.4a,510.2b);
draw (234.8a,510.7b)--(251.4a,510.7b);
draw (280.6a,466.2b)--(280.6a,466.9b);
draw (272.3a,466.2b)--(288.9a,466.2b);
draw (272.3a,466.9b)--(288.9a,466.9b);
draw (318.0a,422.5b)--(318.0a,424.1b);
draw (309.7a,422.5b)--(326.3a,422.5b);
draw (309.7a,424.1b)--(326.3a,424.1b);
draw (355.5a,379.1b)--(355.5a,382.9b);
draw (347.2a,379.1b)--(363.8a,379.1b);
draw (347.2a,382.9b)--(363.8a,382.9b);
draw (393.0a,336.6b)--(393.0a,347.1b);
draw (384.7a,336.6b)--(401.3a,336.6b);
draw (384.7a,347.1b)--(401.3a,347.1b);
draw (430.5a,73.2b)--(430.5a,300.0b);
draw (422.2a,73.2b)--(438.8a,73.2b);
draw (422.2a,300.0b)--(438.8a,300.0b);
draw (617.9a,73.2b)--(617.9a,257.4b);
draw (609.6a,73.2b)--(626.2a,73.2b);
draw (609.6a,257.4b)--(626.2a,257.4b);
draw (655.4a,171.1b)--(655.4a,257.8b);
draw (647.1a,171.1b)--(663.7a,171.1b);
draw (647.1a,257.8b)--(663.7a,257.8b);
draw (692.9a,191.6b)--(692.9a,251.4b);
draw (684.6a,191.6b)--(701.2a,191.6b);
draw (684.6a,251.4b)--(701.2a,251.4b);
draw (805.3a,73.2b)--(805.3a,221.0b);
draw (797.0a,73.2b)--(813.6a,73.2b);
draw (797.0a,221.0b)--(813.6a,221.0b);
draw (842.8a,73.2b)--(842.8a,225.7b);
draw (834.5a,73.2b)--(851.1a,73.2b);
draw (834.5a,225.7b)--(851.1a,225.7b);
draw (880.3a,73.2b)--(880.3a,202.4b);
draw (872.0a,73.2b)--(888.6a,73.2b);
draw (872.0a,202.4b)--(888.6a,202.4b);
draw (917.8a,73.2b)--(917.8a,203.5b);
draw (909.5a,73.2b)--(917.8a,73.2b);
draw (909.5a,203.5b)--(917.8a,203.5b);
gpdraw(4,205.6a,563.1b);
gpdraw(4,243.1a,510.5b);
gpdraw(4,280.6a,466.5b);
gpdraw(4,318.0a,423.4b);
gpdraw(4,355.5a,381.1b);
gpdraw(4,393.0a,342.3b);
gpdraw(4,430.5a,278.5b);
gpdraw(4,617.9a,228.8b);
gpdraw(4,655.4a,239.0b);
gpdraw(4,692.9a,234.7b);
gpdraw(4,805.3a,188.2b);
gpdraw(4,842.8a,205.1b);
gpdraw(4,880.3a,151.3b);
gpdraw(4,917.8a,179.6b);
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
