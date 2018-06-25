DOC=lipics-v2016-sample-article
OPTS = -pdf -dvi-
LATEX = pdflatex

default:
	git pull
	@if (command -v latexmk > /dev/null) ; then latexmk $(OPTS) $(DOC) ; else make brute; fi 

cont: 
	latexmk -pvc $(OPTS) $(DOC)

brute:
	$(LATEX) $(DOC)
	$(LATEX) $(DOC)
	dvipdf $(DOC)
	dvips $(DOC) -o $(DOC).ps

clean:
	latexmk -C

open: 
	git pull
	make
	open -a skim $(DOC).pdf

