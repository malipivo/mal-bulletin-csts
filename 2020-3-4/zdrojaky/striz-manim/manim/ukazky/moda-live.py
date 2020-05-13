from manimlib.imports import *
class ModaLive(Scene):
  def construct(self):
    text=r"\begin{tikzpicture}\node[draw=none]{Móda live!};\end{tikzpicture}"; modalive=TextMobject(text); modalive.scale(6); obdelnik=[""]*5
    obdelnik[0]=TextMobject(text); obdelnik[0].scale(2); obdelnik[0].to_edge(DOWN); obdelnik[0].set_color(YELLOW); obdelnik[0].rotate(PI)
    obdelnik[1]=TextMobject(text); obdelnik[1].scale(2); obdelnik[1].to_edge(UP); obdelnik[1].set_color(YELLOW)
    obdelnik[2]=TextMobject(text); obdelnik[2].scale(2); obdelnik[2].to_edge(LEFT); obdelnik[2].set_color(YELLOW); obdelnik[2].rotate(PI/2)
    obdelnik[3]=TextMobject(text); obdelnik[3].scale(2); obdelnik[3].to_edge(RIGHT); obdelnik[3].set_color(YELLOW); obdelnik[3].rotate(-PI/2)
    self.wait(1); self.play(Write(modalive),run_time=20); self.wait(1); self.play(FadeOut(modalive),run_time=5); self.wait(1)
    for x in [1,3,0,2]: self.play(Write(obdelnik[x]), run_time=2)
    modalive.set_color_by_gradient(RED,BLUE); self.wait(1); self.play(GrowFromCenter(modalive), run_time=5); self.wait(1); self.play(Transform(obdelnik[0], modalive),Transform(obdelnik[1], modalive), run_time=3); self.wait(1); self.play(Transform(obdelnik[2], modalive), Transform(obdelnik[3], modalive), run_time=3)
    for x in range(4): self.remove(obdelnik[x])
    self.play(FadeOut(modalive), run_time=5); self.wait(1); srdce=TextMobject(r"$\varheartsuit$"); srdce.scale(20); srdce.set_color(RED); srdce.rotate(-45); self.play(GrowFromCenter(srdce), run_time=5); self.play(FadeOut(srdce), run_time=2); self.wait(1); self.play(ShowCreation(modalive), run_time=40); self.wait(1); self.play(FadeOut(modalive), run_time=5); self.wait(1)
    
