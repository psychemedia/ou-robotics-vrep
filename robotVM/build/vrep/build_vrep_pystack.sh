#!/usr/bin/env bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#Install base python packages
apt-get -y update
            
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip
  
  # The TM129 V-Rep python stack
  
  #$PIP install git+https://github.com/Troxid/vrep-api-python.git
  $PIP install $THISDIR/root/vrep-api-python-master.zip

done

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

