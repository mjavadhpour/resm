LATEX = latex

DVIPS = dvips

PDFFLAGS = -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress \
           -dCompressPages=true -dUseFlateCompression=true  \
           -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100


%.dvi: %.tex
	$(LATEX) $<

%.ps: %.dvi
	$(DVIPS) -o $@ $<

%.pdf: %.ps
	ps2pdf $(PDFFLAGS) $<

move:
	mv resume.pdf $$(pdfinfo resume.pdf | sed -n '4p' | sed 's/Author://g' | sed 's/\s/_/g' | sed 's/\>$$/-resume.pdf/g' | sed 's/^_*//g')

compile: resume.tex
	pdflatex -shell-escape resume

clean:
	rm -f *~ *.aux *.log *.dvi *.idx *.ilg *.ind *.toc *.fls *.fdb_latexmk *.pdf *.gz

all: compile move
