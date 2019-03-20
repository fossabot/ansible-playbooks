ARA_CALLBACKS = $(shell python -m ara.setup.callback_plugins)
ARA_ACTIONS = $(shell python -m ara.setup.action_plugins)

all:
	echo 'aaa'

prepare:
	pip install --user ara

ara_configure_ansible:
	echo "\ncallback_plugins=$(ARA_CALLBACKS)" >> ansible.cfg
	echo 'action_plugins=$(ARA_CALLBACKS)' >> ansible.cfg

ara_reset:
	printf "y\n" | ara-manage dropall
	ara-manage createall

ara_server:
	ara-manage runserver

pdf:
	docker run --rm -v $(CURDIR):/documents/ -e 'ASCIIDOCTOR_PLUGIN=asciidoctor-rouge' -e 'ASCIIDOCTOR_PDF_THEMES_DIR=docs/resources/themes' -e 'ASCIIDOCTOR_PDF_THEME=default' -e 'ASCIIDOCTOR_PDF_FONTS_DIR=docs/resources/fonts' integr8/alpine-asciidoctor-helper pdf docs/index-ptbr.adoc

pdf_open:
	xdg-open output/index-ptbr.pdf

html:
	docker run --rm -v $(CURDIR):/documents/ -e 'ASCIIDOCTOR_PLUGIN=tel-inline-macro' integr8/alpine-asciidoctor-helper html docs/index-ptbr.adoc

html_open:
	xdg-open output/index-ptbr.html