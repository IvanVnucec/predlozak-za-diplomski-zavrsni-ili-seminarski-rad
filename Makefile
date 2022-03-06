.PHONY: all build clean help

all: build

build:
	pdflatex diplomski_rad.tex

clean:
	rm -rf *.aux *.log *.pdf *.synctex.gz *.blg *.toc

help:
	@echo all build clean help
