#!/bin/bash

# Vyčisti staré
#sh d-cisti.sh


# Konstanty...
# Neberu z aktuálního datumu kvůli zpětné TeXovatelnosti
rok="2020"

# Neměnit
let rocnik=$rok-2008
kamulozit="cislo.tex"

# Měnitelné, cyklus na čísla bulletinku...
for cislo in 1; do # 1 2 3 4

#if [ $cislo -eq 2 ]; then
#cisla="2" # měněná část na dvoj-, troj- a vícečíslo
#else
#cisla="2"
#fi
cisla=$cislo

cislalong=${cisla/-/--} # vysázitelná část
#echo $cislalong

echo "\\rocnik=$rocnik" >$kamulozit
echo "\\cislo=$cislo" >>$kamulozit
echo "\\def\\cisla{$cisla}" >>$kamulozit
echo "\\def\\cislalong{$cislalong}" >>$kamulozit

lualatex -synctex=1 !hlavni-soubor.tex
lualatex -synctex=1 !hlavni-soubor.tex

# Dočasné dva řádky
#cp maosnova-finale.tex maosnova.tex
#cp maosnovab-finale.tex maosnovab.tex

cp !hlavni-soubor.pdf obalka/ib-$rok-$cisla-blok-nahled.pdf

cd obalka
lualatex obalka.tex
lualatex obalka.tex
#rem pdflatex obalka-tisk
cp obalka.pdf ib-$rok-$cisla-obalka.pdf
##xelatex obalka-hrube.tex
#cp obalka-hrube.pdf ib-$rok-$cislo-hrube.pdf
##pdftotext -enc UTF-8 -nopgbrk -layout obalka-hrube.pdf
##coto=ib-$rok-$cislo.htm
##cat obalka-hrube.txt | sed "s/\`/\'/g; s/\”/\"/g;" >$coto
##iconv -f UTF-8 -t CP1250 $coto >cp1250-$coto
texlua tvor-htm.lua

cd ..
cd !finalizace
lualatex ib-temp-a.tex
lualatex ib-temp-b.tex
lualatex ib-tisk.tex
cp ib-temp-a.pdf ../obalka/ib-$rok-$cisla-web.pdf
# barevná verze, do 2019/4
#cp ib-tisk.pdf ../obalka/ib-$rok-$cisla-tisk.pdf
# černobílá verze, od 2020/1
gs -sDEVICE=pdfwrite -sProcessColorModel=DeviceGray -sColorConversionStrategy=Gray -dOverrideICC -o ../obalka/ib-$rok-$cisla-tisk.pdf -f ib-tisk.pdf 
cd ..

#Experiment
#cp !hlavni-soubor.aux aux-$cislo.aux

done # cyklus přes čísla bulletinku


# Miniosnova, rejstřík autorů...
#cd zdrojaky/0-uvodnik
#texlua mini.lua
#cd ../..


# Čisti opravdu zbytečné...
cd obalka
rm -f *.aux *.log *.gz
cd ..
#rm -f *.log # *.aux
#rm -f $kamulozit

# Old version...
#cls
#rem echo \moje=1 >soubor.tex
#rem pdflatex obalka
#rem echo \moje=0 >soubor.tex


