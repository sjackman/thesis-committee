all: 2014-08-22.html 2015-06-15.html 2015-07-27.html 2018-01-30.html

clean:
	rm -f 2014-08-22.html 2015-06-15.html 2015-07-27.html 2018-01-30.html

install-deps:
	brew install pandoc

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

# Rules

# Render Markdown to HTML.
%.html: %.md
	pandoc -Sst revealjs -V theme:sky -o $@ $<

# Download reveal.js
revealjs-3.6.0.tar.gz:
	curl -L -o $@ https://github.com/hakimel/reveal.js/archive/3.6.0.tar.gz

# Extract reveal.js
reveal.js-3.6.0/js/reveal.js: revealjs-3.6.0.tar.gz
	tar xf $<
	touch $@

# Patch reveal.js
reveal.js/js/reveal.js: reveal.js-3.6.0/js/reveal.js
	cp -a reveal.js-3.6.0 reveal.js
	sed -i .orig \
		-e 's/text-transform: uppercase;//' \
		-e 's/font-size: 40px;/font-size: 34px;/' \
		-e 's/border: 4px solid #333;/border: 0px solid #333;/' \
		-e 's/box-shadow: 0 0 10px/box-shadow: 0 0 0px/' \
		reveal.js/css/theme/sky.css
	touch $@
