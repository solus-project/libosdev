PROJECT_ROOT := ./
VERSION = 0.1

.DEFAULT_GOAL := all

_COMPLIABLE = $(shell find ./ -name '*.go' | xargs -I{} /usr/bin/dirname {}|sed 's/.\///g'|uniq|sort)

include Makefile.gobuild

_CHECK_COMPLIANCE = $(addsuffix .compliant,$(_COMPLIABLE))


# Ensure our own code is compliant..
compliant: $(_CHECK_COMPLIANCE)

release:
	git archive --format=tar.gz --verbose -o libosdev-$(VERSION).tar.gz HEAD --prefix=libosdev-$(VERSION)/

all: compliant
