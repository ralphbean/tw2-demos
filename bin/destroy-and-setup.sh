#!/bin/bash -e

source etc/common.sh

rm -rf ~/.virtualenvs/$venv || echo Did not destroy $venv
virtualenv --distribute ~/.virtualenvs/$venv
source ~/.virtualenvs/$venv/bin/activate

pip install --use-mirrors genshi mako Mercurial formencode || exit

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

pushd $clonedir

github_clone toscawidgets tw2.core
github_clone toscawidgets tw2.forms
github_clone toscawidgets tw2.sqla
github_clone toscawidgets tw2.dynforms
github_clone toscawidgets tw2.devtools

github_clone toscawidgets tw2.qrcode

github_clone toscawidgets tw2.jqplugins.ui
github_clone toscawidgets tw2.jqplugins.fg
github_clone toscawidgets tw2.jqplugins.jqgrid
github_clone toscawidgets tw2.jqplugins.jqplot
github_clone toscawidgets tw2.jqplugins.cookies
github_clone toscawidgets tw2.jqplugins.chosen
github_clone toscawidgets tw2.jqplugins.portlets
github_clone toscawidgets tw2.jqplugins.flot
github_clone toscawidgets tw2.jqplugins.dynatree

#github_clone toscawidgets tw2.protovis.core
#github_clone toscawidgets tw2.protovis.conventional
#github_clone toscawidgets tw2.protovis.custom
#github_clone toscawidgets tw2.protovis.hierarchies

github_clone toscawidgets tw2.etc
github_clone toscawidgets tw2.slideymenu
github_clone toscawidgets tw2.jit
github_clone toscawidgets tw2.tipster
github_clone toscawidgets tw2.polymaps
github_clone toscawidgets tw2.rrd
github_clone toscawidgets tw2.captcha
github_clone toscawidgets tw2.d3

github_clone toscawidgets tw2.util.html5shim
github_clone toscawidgets tw2.lesscss
github_clone toscawidgets tw2.dyntext
github_clone toscawidgets tw2.tinymce

pushd
