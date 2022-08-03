#!/bin/sh
set -e

echo "INSTALL REQUIRED PACKAGES"
tlmgr install latexmk synctex texcount latexindent texlogos fontawesome

echo "INSTALL RES"
wget https://ctan.um.ac.ir/macros/latex/contrib/resume/res.cls -O /tmp/res.cls
mkdir /usr/local/texlive/texmf-local/tex/latex/base
mv /tmp/res.cls /usr/local/texlive/texmf-local/tex/latex/base/res.cls
texhash # update tex index
