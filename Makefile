.PHONY: all setup build clean help

all: build

setup:
	sudo apt-get install -y texlive-latex-recommended texlive-lang-european texlive-fonts-recommended

build:
	pdflatex diplomski_rad.tex

clean:
	rm -rf diplomski_rad.aux diplomski_rad.log diplomski_rad.pdf diplomski_rad.synctex.gz diplomski_rad.blg diplomski_rad.toc diplomski_rad.bbl

help:
	@echo all setup build clean help
