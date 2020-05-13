#!/bin/bash
lualatex do-clanku.tex
pdfcrop --hires --margins 1 do-clanku.pdf
rm *.{aux,log}
rm do-clanku.pdf
