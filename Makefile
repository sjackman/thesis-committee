all: 2014-08-22.html

clean:
	rm -f 2014-08-22.html

install-deps:
	brew install pandoc

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

# Rules

%.html: %.md
	pandoc -st revealjs -V theme:sky -o $@ $<
