#!/bin/bash

rm *.pdf

lualatex mal-codeanatomy.tex
lualatex mal-codeanatomy.tex

lualatex mal-emoji.tex

lualatex mal-mercatormap.tex

lualatex mal-nicematrix.tex
lualatex mal-nicematrix.tex
lualatex mal-nicematrix.tex

lualatex mal-pgfornament.tex

lualatex mal-siunitx.tex

lualatex mal-tcolorbox.tex

lualatex mal-tikz-network.tex

lualatex mal-tikz-planets.tex

lualatex mal-witharrows.tex
lualatex mal-witharrows.tex
pdfcrop --hires --margins 1 mal-witharrows.pdf
mv mal-witharrows-crop.pdf mal-witharrows.pdf

lualatex mal-xlop.tex

cd metapost
mpost zoonek.mp
rm zoonek.{log,mpx}
cd ..

rm *.{log,aux}
rm maptiles.texpy
