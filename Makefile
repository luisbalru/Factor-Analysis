PANDOC:=pandoc
FILTERS:=filters/env.hs filters/pandoc-crossref pandoc-citeproc
PFLAGS:=$(foreach filter,$(FILTERS),-F $(filter))

PR_FOLDER:=./presentacion
PR_SECTIONS:=intro.md introduccion.md modelo.md ejemplo.md
PR_SRCS:= $(foreach section, $(PR_SECTIONS), $(PR_FOLDER)/$(section))

PDFS:=presentacion.pdf

.PHONY: all clean check

all: $(PDFS)

presentacion.pdf: $(PR_SRCS) assets/citas.bib
	$(PANDOC) $(PFLAGS) -t beamer $(PR_SRCS) -o $@

clean:
	rm $(PDFS)
