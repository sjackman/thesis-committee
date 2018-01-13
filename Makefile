all: index.html 2014-08-22.html 2015-06-15.html 2015-07-27.html 2018-01-30.html

clean:
	rm -f index.html 2014-08-22.html 2015-06-15.html 2015-07-27.html 2018-01-30.html

install-deps:
	brew install pandoc

.PHONY: all clean install-deps
.DELETE_ON_ERROR:
.SECONDARY:

# Rules

index.html: README.md
	pandoc -Ss $< >$@

%.html: %.md
	pandoc -Sst revealjs -V theme:sky -o $@ $<
