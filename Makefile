SLIDES  := demo-slides
HANDOUT := demo-handout

all: slides handout

clean:
	@rm *aux *bbl *toc *snm *log *nav *blg *out

slides: $(SLIDES).tex
	@pdflatex $(SLIDES)
	if [ -e "bu1.aux" ]; then for auxfile in bu*.aux; do bibtex $${auxfile}; done; else bibtex $(SLIDES); fi
	@pdflatex $(SLIDES)
	@pdflatex $(SLIDES)

handout: $(HANDOUT).tex
	@pdflatex $(HANDOUT)
	if [ -e "bu1.aux" ]; then for auxfile in bu*.aux; do bibtex $${auxfile}; done; else bibtex $(HANDOUT); fi
	@pdflatex $(HANDOUT)
	@pdflatex $(HANDOUT)

