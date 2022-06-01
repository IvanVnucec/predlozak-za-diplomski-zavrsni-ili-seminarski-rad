.PHONY: all setup build clean help

all: build

setup:
	sudo apt-get install -y texlive-latex-recommended texlive-lang-european texlive-fonts-recommended

build:
	pdflatex rad.tex
	bibtex rad.aux
	pdflatex rad.tex
	pdflatex rad.tex

clean:
	rm -rf rad.aux rad.log rad.pdf rad.synctex.gz rad.blg rad.toc rad.bbl

help:
	@echo all setup build clean help
