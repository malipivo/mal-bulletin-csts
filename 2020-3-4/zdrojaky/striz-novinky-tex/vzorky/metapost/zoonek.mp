%! mpost zoonek.mp
prologues := 3;
outputtemplate := "%j-%c.svg";
outputformat := "svg";
beginfig(32)
  u:=1cm; pair A,B,C,D,E,F,G;
  A := (-u,u); B := (0,u); C := (u,u); D := (-u,0); E := (0,0); F := (u,0);
  draw A--D; draw A--E; draw A--F;
  draw B--D; draw B--E; draw B--F;
  draw C--D; draw C--E; draw C--F;
  dotlabel.top(btex $a$ etex, A); dotlabel.top(btex $b$ etex, B);
  dotlabel.top(btex $c$ etex, C); dotlabel.bot(btex $a'$ etex, D);
  dotlabel.bot(btex $b'$ etex, E); dotlabel.bot(btex $c'$ etex, F);
endfig;
bye.