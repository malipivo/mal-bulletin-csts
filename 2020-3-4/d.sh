#!/bin/bash

# Constants... To be changed once a year, I am not using DATE, this variable cannot change later.
# Konstanty...
# Neberu z aktuálního datumu kvůli zpětné TeXovatelnosti
rok="2020"

# Neměnit
let rocnik=$rok-2008
kamulozit="cislo.tex"

# Which issues to typeset?
# Měnitelné, cyklus na čísla bulletinku...
for cislo in 4 3; do # 1 2 3 4

# Do we publish doubleissue?
#if [ $cislo -eq 2 ]; then
#cisla="2" # měněná část na dvoj-, troj- a vícečíslo
#else
#cisla="2"
#fi
cisla=$cislo
cislalong=${cisla/-/--} # vysázitelná část
#echo $cislalong

# Basic variables for TeX
#echo "\\rok=$rok" >$kamulozit
echo "\\rocnik=$rocnik" >$kamulozit
echo "\\cislo=$cislo" >>$kamulozit
echo "\\def\\cisla{$cisla}" >>$kamulozit
echo "\\def\\cislalong{$cislalong}" >>$kamulozit

# Am I manualing typeseting? No, this is an automatic version.
prace="prace.tex"
echo "\\def\\malprace{ne}" >$prace

# Is this version for web or for print?
#prace="prace.tex"
echo "\\def\\barevnost{ano}" >>$prace

# Typesetting issue, the first run.
lualatex -synctex=1 mal-core.tex
#lualatex -synctex=1 mal-core.tex
cp -f maosnova.tex maosnova2.tex

# I am creating an envelope first...
cd obalka
kam="malosnova.tex"
echo -e "\\malosnova=1" >$kam
lualatex obalka.tex
lualatex obalka.tex
#rem pdflatex obalka-tisk
cp obalka.pdf ib-$rok-$cisla-obalka.pdf
#
echo -e "\\malosnova=0" >$kam
lualatex obalka.tex
#
##xelatex obalka-hrube.tex
#cp obalka-hrube.pdf ib-$rok-$cislo-hrube.pdf
##pdftotext -enc UTF-8 -nopgbrk -layout obalka-hrube.pdf
##coto=ib-$rok-$cislo.htm
##cat obalka-hrube.txt | sed "s/\`/\'/g; s/\”/\"/g;" >$coto
##iconv -f UTF-8 -t CP1250 $coto >cp1250-$coto

# Outputting metadata to HTM file...
texlua tvor-htm.lua
cd ..


# Typesetting the issue, the second run.
lualatex -synctex=1 mal-core.tex
# Dočasné dva řádky
#cp maosnova-finale.tex maosnova.tex
#cp maosnovab-finale.tex maosnovab.tex

# Web version: final archive.
cp mal-core.pdf obalka/ib-$rok-$cisla-web.pdf

# Print version
echo "\\def\\barevnost{ne}" >>$prace
lualatex -synctex=1 mal-core.tex

# Needed steps for print version
cd final-steps
lualatex ib-temp-a.tex
lualatex ib-temp-b.tex
lualatex ib-tisk.tex
#cp ib-temp-a.pdf ../obalka/ib-$rok-$cisla-web.pdf
#cp ib-tisk.pdf ../obalka/ib-$rok-$cisla-tisk.pdf
# barevná verze, do 2019/4
#cp ib-tisk.pdf ../obalka/ib-$rok-$cisla-tisk.pdf

# Black&White version for print house.
# černobílá verze, od 2020/1
gs -sDEVICE=pdfwrite -sProcessColorModel=DeviceGray -sColorConversionStrategy=Gray -dOverrideICC -o ../obalka/ib-$rok-$cisla-tisk.pdf -f ib-tisk.pdf 
cd ..

#Experiment
#cp !hlavni-soubor.aux aux-$cislo.aux
done # cyklus přes čísla bulletinku


# I am done with automatic version, set variable for manual typesetting.
echo "\\def\\malprace{ano}" >>$prace

# Miniosnova, rejstřík autorů...
#cd zdrojaky/0-uvodnik
#texlua mini.lua
#cd ../..

# Čisti opravdu zbytečné...
#cd obalka
#rm -f *.aux *.log *.gz
#cd ..
#rm -f *.log # *.aux
#rm -f $kamulozit

# Old version...
#cls
#rem echo \moje=1 >soubor.tex
#rem pdflatex obalka
#rem echo \moje=0 >soubor.tex

