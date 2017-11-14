#!/usr/bin/env bash

echo "======= STARTING OPENCV INSTALL ========"

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#Install base python packages
            
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip
  
  $PIP install numpy
  $PIP install matplotlib
  
  #opencv pre-built for py3 - without support for video (ffmpeg not included in compile)
  #https://github.com/skvark/opencv-python
  #$PIP install opencv-python
  $PIP install opencv-contrib-python

done

# 
# #https://github.com/kindoblue/opencv-vagrant/blob/master/scripts/install.sh
# 
# apt-get -y update && apt-get install -y build-essential && apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# 
# 
# # clone opencv repo's if not done
# if [ ! -d "opencv" ]; then 
#     git clone --depth 1 https://github.com/opencv/opencv.git
#     git clone --depth 1 https://github.com/opencv/opencv_contrib.git
# else
#    cd ~/opencv
#    git pull
#    cd ~/opencv_contrib
#    git pull    
# fi 
# 
# # about to build opencv
# cd ~/opencv
# mkdir -p build
# cd build/
# 
# # configure opencv
# cmake -D CMAKE_BUILD_TYPE=RELEASE \
#  -D CMAKE_INSTALL_PREFIX=/usr/local \
#  -D INSTALL_C_EXAMPLES=OFF \
#  -D INSTALL_PYTHON_EXAMPLES=OFF \
#  -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
#  -D BUILD_EXAMPLES=OFF \
#  -D BUILD_opencv_freetype=OFF  ..
# 
# # compile and install
# make && sudo make install 
# 
# cd $THISDIR
# 

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

echo "======= DONE OPENCV INSTALL ========"

