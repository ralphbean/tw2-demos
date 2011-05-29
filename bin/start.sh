#!/bin/bash

base=/home/threebean/apps/tw2-demos
source $base/etc/common.sh

source ~/.virtualenvs/$venv/bin/activate

#paster tw2.browser --port=27157
paster tw2.browser --port=47478 \
    --enable-pypi-metadata --enable-repo-metadata > \
    tw2-demos.log 2>&1 &

sleep 2
tail tw2-demos.log
