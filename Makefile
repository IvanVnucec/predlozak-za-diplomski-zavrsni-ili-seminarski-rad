.PHONY: all build clean

all: build

build:
	pdflatex diplomski_rad.tex

clean:
	rm -rf *.aux *.log *.pdf *.synctex.gz *.blg *.toc
