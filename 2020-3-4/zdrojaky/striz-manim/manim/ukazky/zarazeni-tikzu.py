from manimlib.imports import *

class Tikzuj(Scene):
  def construct(self):
    text="Ti\\emph{k}Z v akci"
    #tikzuj=TextMobject("\\node{Ranní kuk};")
    #tikzuj=TextMobject("\\draw[line width=12pt](0,0)--(.1,0.05);")
    a=TextMobject("\\node[draw,rounded corners=2mm]{\\phantom{"+text+"}};")
    a.set_color(RED)
    a.scale(5) #5
    b=TextMobject("\\node{"+text+"};")
    b.set_color(BLUE)
    b.scale(5) #5
    tikzuj=VGroup(a,b)
    #self.play(Write(tikzuj),run_time=2)
    #self.wait(1)
    #tikzuj.scale(1)
    self.play(Write(tikzuj),tikzuj.scale,1,run_time=5)
    self.wait(1)
    self.play(tikzuj.scale,5,run_time=5)
    self.wait(1)
    #tikzuj.scale(1/5)
    self.play(tikzuj.scale,0,run_time=5)
    self.wait(0)
    
