ARA_CALLBACKS = $(shell python -m ara.setup.callback_plugins)
ARA_ACTIONS = $(shell python -m ara.setup.action_plugins)

all:
	echo 'aaa'

prepare:
	pip install --user ara

configure_ara:
	echo "\ncallback_plugins=$(ARA_CALLBACKS)" >> ansible.cfg
	echo 'action_plugins=$(ARA_CALLBACKS)' >> ansible.cfg

	ara-manage dropall
	ara-manage createall

ara:
	ara-manage runserver

