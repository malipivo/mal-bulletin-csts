#rem ! pdflatex ib-temp-a.tex
#rem pdflatex ib-2012-2-web.tex

#rem ! pdflatex ib-temp-b.tex
#rem ! pdflatex ib-tisk.tex
#rem ! move ib-temp-a.pdf ib-2012-X-web.pdf
#rem ! move ib-tisk.pdf ib-2012-X-tisk.pdf

rm -f *.log *.aux *.gz *.pdf *.out 
rm -f *.ind *.idx # nové
rm -f maosnova.tex maosnovab.tex maosnova2.tex stran.tex
rm -f *.{bbl,blg}
#rm -f cislo.tex 
rm -f aux-*.aux

cd obalka
rm -f utf8-*.htm
rm -f *.log *.aux *.gz *.*~
rm -f ib-*-nahled.pdf
rm -f ib-*.txt
rm -f obalka.pdf
rm -f obalka-hrube.{pdf,txt}

cd ..
cd !finalizace
rm -f *.log *.aux *.pdf 

cd ..

