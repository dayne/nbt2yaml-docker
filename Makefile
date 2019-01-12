# CREDIT to Mark English for original Makefile
# https://spin.atomicobject.com/2015/11/30/command-line-tools-docker/
PREFIX ?= $(HOME)/.local/
VERSION = "0.0.1"

all: install

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 nbt2yaml.sh $(DESTDIR)$(PREFIX)/bin/nbt2yaml

uninstall:
	@$(RM) $(DESTDIR)$(PREFIX)/bin/nbt2yaml
	@docker rmi dayne/nbt2yaml:$(VERSION)
	@docker rmi dayne/nbt2yaml:latest

build:
	@docker build -t dayne/nbt2yaml:$(VERSION) . \
	&& docker tag dayne/nbt2yaml:$(VERSION) dayne/nbt2yaml:latest

publish: build
	@docker push dayne/nbt2yaml:$(VERSION) \
	&& docker push dayne/nbt2yaml:latest

.PHONY: all install uninstall build publish
