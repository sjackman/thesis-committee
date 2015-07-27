all: 2014-08-22.html 2015-06-15.html 2015-07-27.html

clean:
	rm -f 2014-08-22.html 2015-06-15.html 2015-07-27.html

install-deps:
	brew install pandoc

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

# Rules

%.html: %.md
	pandoc -Sst revealjs -V theme:sky -o $@ $<
