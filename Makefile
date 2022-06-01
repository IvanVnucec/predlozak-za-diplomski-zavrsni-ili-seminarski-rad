.PHONY: all setup build create_build_folder clean help

all: build

setup:
	sudo apt-get install -y texlive-latex-recommended texlive-lang-european texlive-fonts-recommended

build: | create_build_folder
	pdflatex -halt-on-error -output-directory build rad.tex
	bibtex build/rad.aux
	pdflatex -halt-on-error -output-directory build rad.tex
	pdflatex -halt-on-error -output-directory build rad.tex

create_build_folder:
	mkdir -p build

clean:
	rm -rf build

help:
	@echo all setup build clean help
