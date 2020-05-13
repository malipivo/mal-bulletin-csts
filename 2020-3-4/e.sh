#!/bin/bash

# Polishing folders before "git push"...

#rem ! pdflatex ib-temp-a.tex
#rem pdflatex ib-2012-2-web.tex

#rem ! pdflatex ib-temp-b.tex
#rem ! pdflatex ib-tisk.tex
#rem ! move ib-temp-a.pdf ib-2012-X-web.pdf
#rem ! move ib-tisk.pdf ib-2012-X-tisk.pdf

rm -f *.log *.aux *.gz *.pdf *.out *.brf
rm -f *.ind *.idx # nové
rm -f maosnova.tex maosnovab.tex maosnova2.tex stran.tex
rm -f *.{bbl,blg}
rm -f prace.tex # cislo.tex 
rm -f aux-*.aux

cd obalka
rm -f malosnova.tex
#rm -f ib-*-utf8.htm
rm -f *.log *.aux *.gz *.*~
#rm -f ib-*.pdf
rm -f ib-*.txt
rm -f obalka.{pdf,out}
rm -f obalka-hrube.{pdf,txt}
cd ..

cd final-steps
rm -f *.log *.aux *.pdf 
cd ..

