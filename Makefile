.PHONY: all build clean help

all: build

build:
	pdflatex diplomski_rad.tex

clean:
	rm -rf diplomski_rad.aux diplomski_rad.log diplomski_rad.pdf diplomski_rad.synctex.gz diplomski_rad.blg diplomski_rad.toc diplomski_rad.bbl

help:
	@echo all build clean help
