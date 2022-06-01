SRC_NAME := rad
BUILD_DIR := build
FLAGS := -halt-on-error

# For testing
# CAUTION: GH Actions Upload test artifacts depends on this
DPL_NAME := dpl
ZAV_NAME := zav
SEM_NAME := sem
DPL_TEST_DIR := $(BUILD_DIR)/tests/dpl
ZAV_TEST_DIR := $(BUILD_DIR)/tests/zav
SEM_TEST_DIR := $(BUILD_DIR)/tests/sem

# $(call export_to_pdf,src,output_dir,filename,flags)
define export_to_pdf
	mkdir -p $(2)
	pdflatex $(4) -output-directory $(2) $(1).tex
	bibtex $(2)/$(1).aux
	pdflatex $(4) -output-directory $(2) $(1).tex
	pdflatex $(4) -output-directory $(2) $(1).tex
	mv $(2)/$(1).pdf $(2)/$(3).pdf 2>/dev/null; true
endef

.PHONY: all setup build test clean help

all: build

setup:
	sudo apt-get install -y texlive-latex-recommended texlive-lang-european texlive-fonts-recommended

build:
	$(call export_to_pdf,$(SRC_NAME),$(BUILD_DIR),$(SRC_NAME),$(FLAGS))

# for testing only, do not modify
TEST_DPL_DCM_CLASS := \documentclass[times, utf8, diplomski, numeric]{templates\/fer}
TEST_ZVR_DCM_CLASS := \documentclass[times, utf8, zavrsni, numeric]{templates\/fer}
TEST_SEM_DCM_CLASS := \documentclass[times, utf8, seminar, numeric]{templates\/fer}
SRC_NAME_COPY := $(SRC_NAME)_copy
test:
	cp $(SRC_NAME).tex $(SRC_NAME_COPY).tex
	sed -i '2s/.*/\$(TEST_DPL_DCM_CLASS)/' $(SRC_NAME_COPY).tex && $(call export_to_pdf,$(SRC_NAME_COPY),$(DPL_TEST_DIR),$(DPL_NAME),$(FLAGS))
	sed -i '2s/.*/\$(TEST_ZVR_DCM_CLASS)/' $(SRC_NAME_COPY).tex && $(call export_to_pdf,$(SRC_NAME_COPY),$(ZAV_TEST_DIR),$(ZAV_NAME),$(FLAGS))
	sed -i '2s/.*/\$(TEST_SEM_DCM_CLASS)/' $(SRC_NAME_COPY).tex && $(call export_to_pdf,$(SRC_NAME_COPY),$(SEM_TEST_DIR),$(SEM_NAME),$(FLAGS))
	rm $(SRC_NAME_COPY).tex

clean:
	rm -rf $(BUILD_DIR)

help:
	@echo all setup build test clean help
