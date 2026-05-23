.SUFFIXES:	.html .txt .tex .dvi .ps .pdf .aux .log .toc .lof .lot .bbl .bib .blg .idx .ind .ilg

### プログラム ###
XSLT=		xsltproc
TEX=		lualatex
BIBTEX=		bibtex -min-crossrefs=0
RM=		rm -f


### データ ###
NAME=	LENLS22

### ターゲット ###
all:	html txt tex
html:	$(NAME).html
txt:	$(NAME).txt
tex:	$(NAME).tex
pdf:	$(NAME).pdf

### ビルドルール ###
$(NAME).html:	$(NAME).xml programHTML.xsl style.css
			$(XSLT) programHTML.xsl $(NAME).xml > $(NAME).html
			cat $(NAME).html > index.html

$(NAME).txt:	$(NAME).xml programText.xsl
			$(XSLT) programText.xsl $(NAME).xml | sed 1d > $(NAME).txt

$(NAME).tex:	$(NAME).xml programTeX.xsl
			$(XSLT) programTeX.xsl $(NAME).xml | sed 1d | ./pagenumber.pl > $(NAME).tex

$(NAME).pdf:	$(NAME).tex
			$(TEX) $(NAME).tex

jsai:
			$(XSLT) programJSAIhtml.xsl $(NAME).xml | sed 1d > $(NAME).JSAI.html
