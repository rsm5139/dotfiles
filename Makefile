SHELL = /bin/sh

install:
	@. scripts/install.sh "$$PWD"

uninstall:
	@. scripts/uninstall.sh "$$PWD"

upgrade:
	@. scripts/upgrade.sh "$$PWD"

.PHONY: install uninstall upgrade