# Predlozak za Diplomski, Zavrsni ili Seminarski rad

## About
Ovo je projekt koji sadrzi predlozak (template) u Latexu za Diplomski, Zavrsni ili Seminarski rad.
Predlozak je moguce jednostavno editirat i kompajlirat (exportat u PDF). 

## Installing
```
NOTE: Recommended OS for developing is Ubuntu 21.10 (also Ubuntu 20.04).
```
1. (recommended) Fork and clone the repository and `cd` into project root directory.
2. If on Ubuntu run `sudo make install` to install LaTex tools, 
    - otherwise, install [MiKTeX](https://miktex.org/).

## Building
1. Run `make build` to build `rad.pdf`.
2. (optional) If you fork the repository, check out GH Actions: on every push
GH Actions will build the LaTex document and upload it as Actions build artifact.

## Help
For Latex Template help see [docs/LaTeX_template_upute.pdf](docs/LaTeX_template_upute.pdf).
