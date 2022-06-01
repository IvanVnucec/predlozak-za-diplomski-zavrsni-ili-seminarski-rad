SRC_NAME := rad
BUILD_DIR := build
FLAGS := -halt-on-error

.PHONY: all setup build create_build_folder clean help

all: build

setup:
	sudo apt-get install -y texlive-latex-recommended texlive-lang-european texlive-fonts-recommended

build: | create_build_folder
	pdflatex $(FLAGS) -output-directory $(BUILD_DIR) $(SRC_NAME).tex
	bibtex $(BUILD_DIR)/$(SRC_NAME).aux
	pdflatex $(FLAGS) -output-directory $(BUILD_DIR) $(SRC_NAME).tex
	pdflatex $(FLAGS) -output-directory $(BUILD_DIR) $(SRC_NAME).tex

create_build_folder:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

help:
	@echo all setup build clean help
