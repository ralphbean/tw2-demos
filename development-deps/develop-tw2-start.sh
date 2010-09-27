#!/bin/bash

devbase=development-deps
venv=$devbase/virtualenv-tw2.jquery
source $venv/bin/activate

sudo paster tw2.browser --listen=craftsman.rc.rit.edu --port=80



