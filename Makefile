all: thesis-committee.html

clean:
	rm -f thesis-committee.html

install-deps:
	brew install pandoc

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

# Rules

%.html: %.md
	pandoc -st revealjs -V theme:sky -o $@ $<
