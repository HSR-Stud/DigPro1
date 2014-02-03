SHELL=bash
TARGET=DigPro1.pdf
LL=latexmk -pdf
CLEAN=latexmk -C


all: revisionMake $(TARGET) revisionRevert

revisionMake:
	echo "% Autogenerated, do not edit" > revision.tex
	echo "\\newcommand{\\revisiondate}{`git log -1 --format=\"%ad\" --date=short`}" >> revision.tex
	echo "\\newcommand{\\revision}{`git log -1 --format=\"%h\"`}" >> revision.tex

$(TARGET): $(TARGET:%.pdf=%.tex) revision.tex
	$(LL) $<

revisionRevert: revision.tex
	#rm -f revision.tex

clean:
	$(CLEAN)
	rm -f revision.tex
	git clean -X -f -d