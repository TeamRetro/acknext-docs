
INDIR=markdown
OUTDIR=html
STYLEDIR=style
PAGES=$(filter-out toc,$(basename $(shell ls markdown | grep md$)))

all: $(OUTDIR)/index.htm \
	$(OUTDIR)/page-style.css \
	$(OUTDIR)/toc.css \
	$(addprefix $(OUTDIR)/,$(addsuffix .htm,$(PAGES))) \
	$(OUTDIR)/img

$(OUTDIR)/index.htm: index.htm $(OUTDIR)/toc.htm

REN_WIKI=sed -E "s|\[\[(\w+)\]\]|<a href=\"\1.htm\" target=\"content\">\1</a>|g"
REN_NAV=sed -E "s|\*(\w+)\*|<span class='treenode'>\1</span>|g"

$(OUTDIR)/toc.htm: $(INDIR)/toc.md
	cat $< \
	| $(REN_WIKI) \
	| $(REN_NAV) \
	| ./render-wiki-page.rb toc.css \
	> $@

$(OUTDIR)/%.htm: %.php
	php $< > $@

$(OUTDIR)/%.htm: $(INDIR)/%.md
	cat $< \
	| $(REN_WIKI) \
	| ./render-wiki-page.rb \
	> $@

$(OUTDIR)/%.css: $(STYLEDIR)/%.css
	cp $< $@

$(OUTDIR)/img:
	mkdir -p $@
	cp img/* $(OUTDIR)/img/
	
.PHONY: img