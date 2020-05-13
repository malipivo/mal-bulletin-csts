from manimlib.imports import *
class AhojSvete(Scene):
    def construct(self):
        svetu = TextMobject("Ahoj, světe!")
        self.play(Write(svetu))
        self.wait()
