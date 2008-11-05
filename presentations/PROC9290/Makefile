fast:
	rm -f fsmnlp.toc fsmnlp.aux fsmnlp.blg fsmnlp.idx
	latex  fsmnlp
#	bibtex fsmnlp 
#	latex  fsmnlp
#	latex  fsmnlp
	makeindex  -s lib/sprmindx.sty fsmnlp
	latex  fsmnlp
	latex  fsmnlp
	dvips -Ppdf -ta4 -G0 -f fsmnlp -o fsmnlp.ps
	# -G0 or -G1 should fix the ligature problem of earlier dvips versions
	# -Ppdf specifies PDF-related configurations for font inclusion
	ps2pdf fsmnlp.ps
	rm -f fsmnlp.toc fsmnlp.aux fsmnlp.blg fsmnlp.idx fsmnlp.ilg fsmnlp.ind 

all:
	# this cannot be run for the HLaTeX contribution, because it does not 
	# employ a standard inputencoding that could be parsed by BIBTEX.
	rm -f fsmnlp.toc fsmnlp.aux fsmnlp.blg fsmnlp.idx
	latex  fsmnlp
	bibtex fsmnlp 
	latex  fsmnlp
	latex  fsmnlp
	makeindex  -s lib/sprmindx.sty fsmnlp
	latex  fsmnlp
	latex  fsmnlp
	dvips -Ppdf -ta4 -G0 -f fsmnlp -o fsmnlp.ps
	# -G0 or -G1 should fix the ligature problem of earlier dvips versions
	# -Ppdf specifies PDF-related configurations for font inclusion
	ps2pdf fsmnlp.ps
	rm -f fsmnlp.toc fsmnlp.aux fsmnlp.blg fsmnlp.idx fsmnlp.ilg fsmnlp.ind 

clean:
	rm -f fsmnlp.toc fsmnlp.aux fsmnlp.blg fsmnlp.idx fsmnlp.ilg fsmnlp.ind 
	rm -f fsmnlp.pdf fsmnlp.dvi fsmnlp.ps  fsmnlp.log


