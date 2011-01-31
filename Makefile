# makefile for pdflatex
#
MAKEFLAGS += -j4
SOURCES=$(wildcard fig/*.svg)
OBJECTS=$(SOURCES:.svg=.pdf)

%.pdf: %.svg
	inkscape --export-latex --export-area-drawing --export-pdf $@ $<

notes.pdf: notes.tex introduction.tex $(OBJECTS)
	pdflatex -file-line-error notes

clean:
	rm -f fig/*.pdf fig/*.pdf_tex notes.{aux,bbl,blg,lof,log,lot,out,toc}

