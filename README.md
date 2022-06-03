[![Test LaTex templates](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad/actions/workflows/test_latex_templates.yml/badge.svg)](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad/actions/workflows/test_latex_templates.yml)

# Predlozak za Diplomski, Zavrsni ili Seminarski rad

<p align="middle">
  <img src=".github/misc/dipl.png" height="280"/>
  <img src=".github/misc/zavr.png" height="280" /> 
  <img src=".github/misc/sem.png"  height="280" />
</p>

## About
Ovo je projekt koji sadrzi predlozak (template) u Latexu za Diplomski, Zavrsni ili Seminarski rad.
Idealno za brzo pisanje i jednostavno pretvaranje u PDF. Cilj je da ovaj repozitorij bude _the goto_
predlozak za sve radove (barem na FER-u).

Predlozak se sastoji od:
- prikladne prve (naslovne) stranice
- stranica zahvale
- sadrzaj
- literatura
- sazetak (na hrvatskom i engleskom jeziku)
- i jos mnogo toga...

Sve to je moguce generirati pomocu jedne jedine komande (vidi ispod instrukcije). Takodjer
ovaj rad je moguce pravopisno provjeriti, vidi kako [ovdje](#spellchecking).

## Installing
```
NOTE: Recommended OS for developing is Ubuntu 21.10 (also Ubuntu 20.04).
```
1. (recommended) Fork and clone the repository and `cd` into project root directory.
    - or if you don't know Git, download files [here](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad/archive/refs/heads/master.zip)
2. If on Ubuntu run `sudo make install` to install LaTex tools (about 275 MB), 
    - otherwise, install [MiKTeX](https://miktex.org/).

## Writing
Make changes in `rad.tex` and `literatura.bib`, other files leave unchanged. 
- For template usage see [Help](#help).

## Spellchecking
To spellcheck the text, run `make spellcheck`. Highlighted words will appear in
the console. To add certain unknown word (aka to disable spellcheck warnings), 
append it to the `dictionary.txt` file located in the root dir. The `dictionary.txt`
file contains user defined words.  
Be aware that the `dictionary.txt` must follow format where at the top of the file 
must be header like this:
```
personal_ws-1.1 hr 0 utf-8
```
To understand what all that means, user is advised to check [this](http://aspell.net/man-html/Format-of-the-Personal-and-Replacement-Dictionaries.html) link.
User defined words are listed below the header.

## Building
1. Run `make build` to build PDF document in `build/rad.pdf`.
2. (optional) If you fork the repository, check out GH Actions: on every push
GH Actions will build the LaTex document and upload it as Actions build artifact.

## Usage
For all available commands run `make help`.
```
make [option]
  option:
     all         - build (default)
     setup       - install all the tools needed for building LaTex
     build       - build LaTex document
     spellcheck  - run spellcheck (Croatian language)
     test        - run LaTex template tests
     clean       - clean LaTex build artifacts
     help        - print this message
```

## Testing
```
NOTE: for developers only.
```
To test if all the templates are valid, run `make test`. This command will create test folder under `build/tests` and it
will try to build all the templates into its own subdirectories.

## Files
```
.
├── .github             - direktorij za GitHub Actions
├── build               - direktorij sa build artefaktima (ukljucujuci .pdf)
├── docs                - direktorij sa LaTex template uputama
├── scripts             - direktorij sa pomocnim skriptama
├── templates           - direktorij sa LaTex template-ovima (moguce modificirat) 
├── tests               - direktorij sa LaTex template testovima 
├── .gitignore          - gitignore 
├── dictionary.txt      - korisnikov rjecnik (sluzi za ispravljanje pravopisa) 
├── enumitem.sty        - dodatni paket za LaTex (ne modificiraj)
├── literatura.bib      - ovdje su citati (ovo modificiraj)
├── LICENSE             - licenca
├── Makefile            - omogucuje instaliranje alata, buildanje PDF dokumenta...
├── rad.tex             - ovdje je rad (ovo modificiraj)
├── README.md           - readme
└── tocbibind.sty       - dodatni paket za LaTex (ne modificiraj)
```

## Help
- for command usages help run `make help`
- for Latex Template help see [docs/LaTeX_template_upute.pdf](docs/LaTeX_template_upute.pdf).

## References
LaTex Predlozak i Upute smo preuzeli sa FER-ove stranice i blago modificirali (vidi git log).
