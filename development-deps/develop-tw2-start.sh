#!/bin/bash

devbase=development-deps
venv=$devbase/virtualenv
source $venv/bin/activate

sudo paster tw2.browser --listen=craftsman.rc.rit.edu --port=80 --enable-pypi-metadata --enable-repo-metadata

