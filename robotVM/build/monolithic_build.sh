#!/usr/bin/env bash

echo "Starting TM129 Robots monolithic VM build sequence..."

#Set the base build directory to the one containing this script
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Keep track of build datetime
$THISDIR/version.sh

#Build script for building machine
$THISDIR/base/basepackages.sh
$THISDIR/base/basedesktop.sh
$THISDIR/base/basepy.sh


#Jupyter space
$THISDIR/jupyter-base/build_jupyter.sh
$THISDIR/jupyter-custom/jupyter_nbextensions.sh
$THISDIR/jupyter-custom/jupyter_styling.sh

#Local extensions
$THISDIR/jupyter-custom/jupyter_extensions.sh

#V-REP
$THISDIR/vrep/build_vrep.sh
$THISDIR/vrep/build_vrep_pystack.sh

#tidy up
apt-get autoremove -y && apt-get clean && updatedb

echo "...TM129 monolithic VM build sequence done."