#!/bin/bash
lualatex solo1.tex
lualatex solo2.tex
lualatex solo2b.tex
rm *.{log,aux}
