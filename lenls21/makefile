.SUFFIXES:	.html .txt .tex .dvi .ps .pdf .aux .log .toc .lof .lot .bbl .bib .blg .idx .ind .ilg

### プログラム ###
XSLT=		xsltproc
TEX=		platex -kanji=utf8
BIBTEX=		jbibtex -min-crossrefs=0 
DVIOUT=		/usr/share/dviout/dviout.exe
DVIPS=		dvipsk
RM=			rm -f
ACRODIST=	"/cygdrive/c/Program Files (x86)/Adobe/Acrobat 9.0/Acrobat/acrodist.exe"

### データ ###
NAME=	LENLS20

### ターゲット ###
all:	html
html:	$(NAME).html
txt:	$(NAME).txt
tex:	$(NAME).tex
dvi:	$(NAME).dvi
ps:		$(NAME).ps
pdf:	$(NAME).pdf

### 依存関係 ###
$(NAME).html:	$(NAME).xml programHTML.xsl
$(NAME).txt:	$(NAME).xml programText.xsl
$(NAME).tex:	$(NAME).xml programTeX.xsl
$(NAME).dvi:	$(NAME).tex $(SOURCES) $(RULES) $(FIGURES) $(MACRO)
$(NAME).ps:	$(NAME).dvi 
$(NAME).pdf:	$(NAME).ps

### ターゲット ###
.xml.html:
			$XSLT programHTML.xsl $NAME.xml > $NAME.html
			cat $NAME.html > index.html
.xml.txt:
			$XSLT programText.xsl $NAME.xml | sed 1d > $NAME.txt
.xml.tex:
			$XSLT programTeX.xsl $NAME.xml | sed 1d | ./pagenumber.pl > $NAME.tex
.tex.dvi:
			$TEX $<
.dvi.ps:
			$(DVIPS) -D1200 -t a5paper -Ppdf -G0 -f -z $^ | bkmk2uni > $@
.ps.pdf:
			pwd | xargs -n 1 cygpath -m | xargs -I {} $(ACRODIST) /F {}/$(NAME).ps &
jsai:
			$XSLT programJSAIhtml.xsl $NAME.xml | sed 1d > $NAME.JSAI.html
