#!/bin/bash -e

devbase=development-deps
venv=$devbase/virtualenv
$(
    rm -rf $venv
) || echo "Did not destroy $venv"

virtualenv --no-site-packages $venv

source $venv/bin/activate

pip install --use-mirrors genshi mako formencode || exit

function bitbucket_clone {
        hg clone http://bitbucket.org/$1/$2 || \
                (pushd $2 && hg pull && hg update && popd)
        pushd $2 ; python setup.py develop install_lib install_egg_info ; popd
}

function github_clone {
        git clone git://github.com/$1/$2.git || \
                (pushd $2 && git pull && popd)
        pushd $2 ; python setup.py develop install_lib install_egg_info ; popd
}

pushd $devbase

bitbucket_clone ralphbean tw2core
bitbucket_clone ralphbean tw2.devtools
bitbucket_clone paj tw2forms
bitbucket_clone toscawidgets tw2jquery

bitbucket_clone josephtate tw2.jqplugins.elrte
bitbucket_clone josephtate tw2.jqplugins.elfinder

github_clone ralphbean tw2.jqplugins.ui
github_clone ralphbean tw2.jqplugins.fg
github_clone ralphbean tw2.jqplugins.jqgrid
github_clone ralphbean tw2.jqplugins.jqplot
github_clone ralphbean tw2.jqplugins.cookies
github_clone ralphbean tw2.jqplugins.portlets
github_clone ralphbean tw2.jqplugins.flot
github_clone ralphbean tw2.jqplugins.dynatree

github_clone ralphbean tw2.protovis.core
github_clone ralphbean tw2.protovis.conventional
github_clone ralphbean tw2.protovis.custom
github_clone ralphbean tw2.protovis.hierarchies

github_clone ralphbean tw2.etc
github_clone ralphbean tw2.jit
github_clone ralphbean tw2.tipster
github_clone ralphbean tw2.polymaps

pushd # $devbase
