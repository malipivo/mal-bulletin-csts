from manimlib.imports import *

class Japonstina(Scene):
  def construct(self):
    sum1=TextMobject(r"今日は何曜日ですか。")
    sum1.scale(2.5); sum1.to_edge(UP); sum1.set_color(RED); self.play(Write(sum1), run_time=3); self.wait(1)
    sum2=TextMobject(r"３日です。")
    sum2.scale(6); sum2.to_edge(DOWN); sum2.set_color(RED)
    self.play(ReplacementTransform(sum1.copy(),sum2),run_time=5); self.wait(2)
    
