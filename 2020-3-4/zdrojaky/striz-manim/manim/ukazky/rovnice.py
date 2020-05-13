from manimlib.imports import *
class Rovnice(Scene):
  def construct(self):
    sum1=TextMobject(r"$$\sum_{i=0}^{n} {n\choose i} a^{n-i} b^i = (a+b)^n$$")
    sum1.scale(2); sum1.to_edge(UP); sum1.set_color(WHITE); self.play(Write(sum1), run_time=3); self.wait(1)
    sum2=TextMobject(r"$$\mathwitch*_{i=0}^{n} {n\choose i} \mathrightghost^{n-i} \mathleftghost^i \xrightwitchonbroom*{} (\mathrightghost+\mathleftghost)^n$$")
    sum2.scale(1.75); sum2.to_edge(DOWN); sum2.set_color(WHITE)
    self.play(ReplacementTransform(sum1.copy(), sum2), run_time=6); self.wait(4)
    
