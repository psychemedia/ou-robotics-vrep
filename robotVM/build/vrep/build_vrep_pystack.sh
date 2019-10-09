#!/usr/bin/env bash

echo "======= STARTING VREP PY INSTALL ========"

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#Install base python packages
apt-get -y update
            
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip
  
  # The TM129 V-Rep python stack
  
  #$PIP install $THISDIR/root/vrep-api-python-master.zip
  $PIP install git+https://github.com/Troxid/vrep-api-python.git
  $PIP install git+https://github.com/stepjam/PyRep.git

  #PyRep
  # Should be doing this as a .bashrc for RDP user access?
  echo "export VREP_ROOT=${VREPPATH}" >> .profile
  echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VREP_ROOT" >> .profile
  echo "export QT_QPA_PLATFORM_PLUGIN_PATH=$VREP_ROOT" >> .profile

  #data collection
  $PIP install pandas
  
  #Image processing and display
  $PIP install matplotlib
  $PIP install Pillow

done

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

echo "======= DONE VREP PY INSTALL ========"