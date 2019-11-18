NAME := data_and_methods

default: prep doc
all: prep doc

prep: svg lst

doc:	prep build/$(NAME).pdf

dev: CONT_FLAG = -pvc
dev: latex-force prep story

svg: $(patsubst %.svg,build/%.pdf,$(wildcard images/*.svg))
lst: $(patsubst %.tex,build/%.pdf,$(wildcard listings/*.tex))

build/%.pdf: %.tex
	mkdir -p build
	latexmk $(CONT_FLAG) -shell-escape -pdf -g -f -auxdir=build -outdir=build $<

show: build/$(NAME1).pdf
	xdg-open $<

clean:
	rm -f *.tmp *.tui *.log *.tuc *.mp *.bbl *.blg *.fls *.idx *.aux *.out *.fdb_latexmk *.ilg *.ind
	rm -rf build

distclean: clean
	rm -f build/$(NAME1).pdf
