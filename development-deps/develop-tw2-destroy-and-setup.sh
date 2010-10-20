#!/bin/bash -e

devbase=development-deps
venv=$devbase/virtualenv-tw2.jquery
$(
    rm -rf $venv
) || echo "Did not destroy $venv"

virtualenv $venv --no-site-packages

source $venv/bin/activate

pip install genshi || exit
pip install formencode || exit

pushd $devbase

hg clone http://bitbucket.org/paj/tw2core || \
        (pushd tw2core && hg pull && popd)
hg clone http://bitbucket.org/paj/tw2devtools || \
        (pushd tw2devtools && hg pull && popd)
hg clone http://bitbucket.org/paj/tw2forms || \
        (pushd tw2forms && hg pull && popd)

hg clone http://bitbucket.org/toscawidgets/tw2jquery || \
        (pushd tw2jquery && hg pull && popd)
git clone git://github.com/ralphbean/tw2.jquery.plugins.ui.git || \
        (pushd tw2.jquery.plugins.ui && git pull && popd)
git clone git://github.com/ralphbean/tw2.jquery.plugins.fg.git || \
        (pushd tw2.jquery.plugins.fg && git pull && popd)
git clone git://github.com/ralphbean/tw2.jquery.plugins.jqgrid.git || \
        (pushd tw2.jquery.plugins.jqgrid && git pull && popd)

git clone git://github.com/ralphbean/tw2.jit.git || \
        (pushd tw2.jit && git pull && popd)

git clone git://github.com/ralphbean/tw2.protovis.core.git || \
        (pushd tw2.protovis.core && git pull && popd)
git clone git://github.com/ralphbean/tw2.protovis.conventional.git || \
        (pushd tw2.protovis.conventional && git pull && popd)
git clone git://github.com/ralphbean/tw2.protovis.custom.git || \
        (pushd tw2.protovis.custom && git pull && popd)
git clone git://github.com/ralphbean/tw2.protovis.hierarchies.git || \
        (pushd tw2.protovis.hierarchies && git pull && popd)

pushd tw2core ;  python setup.py develop ; popd
pushd tw2forms ; python setup.py develop ; popd
pushd tw2devtools ; python setup.py develop ; popd

pushd tw2jquery ; python setup.py install_lib install_egg_info ; popd
pushd tw2.jquery.plugins.ui ; python setup.py install_lib install_egg_info ; popd
pushd tw2.jquery.plugins.fg ; python setup.py install_lib install_egg_info ; popd
pushd tw2.jquery.plugins.jqgrid ; python setup.py install_lib install_egg_info ; popd

pushd tw2.jit ; python setup.py develop ; popd

pushd tw2.protovis.core ; python setup.py develop ; popd
pushd tw2.protovis.conventional ; python setup.py develop ; popd
pushd tw2.protovis.custom ; python setup.py develop ; popd
pushd tw2.protovis.hierarchies ; python setup.py develop ; popd

pushd # $devbase
