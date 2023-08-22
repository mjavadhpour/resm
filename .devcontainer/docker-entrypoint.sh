#!/bin/sh
set -e

echo "INSTALL REQUIRED PACKAGES"
tlmgr install latexmk synctex texcount latexindent texlogos fontawesome simpleicons

echo "INSTALL RES"
wget https://mirrors.evoluso.com/CTAN/macros/latex/contrib/resume/res.cls -O /tmp/res.cls
mkdir /usr/local/texlive/texmf-local/tex/latex/base
mv /tmp/res.cls /usr/local/texlive/texmf-local/tex/latex/base/res.cls
texhash # update tex index
