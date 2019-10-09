#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "======= STARTING VREP INSTALL / BUILD ========"

#DEBUG TOOLS
#systemctl list-units | grep vrep
#journalctl -u vrep.service

VREPDIST="V-REP_PRO_EDU_V3_6_2_Ubuntu18_04"
VREPPATH="/opt/$VREPDIST"

VREPXZ="${VREPDIST}.tar.xz"
VREPSRC="http://coppeliarobotics.com/files/${VREPDIST}.tar.xz"

echo "Setting up V-Rep: "

#Prep for download
mkdir -p /opt
mkdir -p /root

if [ ! -f /opt/vrep.done ]; then
	echo "Downloading V-Rep..."
	if [ ! -f $THISDIR/root/$VREPGZ ]; then
		/usr/bin/wget -q --no-check-certificate  -P /root $VREPSRC
	else
		cp $THISDIR/root/$VREPGZ /root/$VREPGZ
	fi
	echo "...downloaded V-Rep"
	
	echo "Unpacking V-Rep..."
	tar -xf /root/$VREPXZ -C /opt  && rm /root/$VREPXZ
	#Unpacks to: /opt/$VREPDIST
	
	#Add shortcut to run V-REP to desktop
	cp -r $THISDIR/home/vagrant/Desktop/. /home/vagrant/Desktop/
	chmod +x /home/vagrant/Desktop/*.desktop 
	
	#Autorun V-REP
	#https://askubuntu.com/a/598202
	mkdir -p /home/vagrant/.config/autostart
	chmod ugo+w /home/vagrant/.config
	cp -r $THISDIR/home/vagrant/.config/autostart/. /home/vagrant/.config/autostart/
    chmod +x /home/vagrant/.config/autostart/*.desktop 
    
	touch /opt/vrep.done
	echo "...unpacked V-Rep"
else
	echo "...already downloaded and unpacked V-Rep"
fi

#TO DO: Need to specify a user and cd to their home dir
#At the moment, this assumes everything is root?!
cd
source .profile && [ -z "$VREP_VM" ] && echo "export VREP_VM=1" >> .profile

echo "export VREP=${VREPPATH}" >> .profile
echo "export VREP_LIBRARY=${VREPPATH}/programming/remoteApiBindings/lib/lib/64Bit/" >> .profile

cd $THISDIR
echo "======= DONE VREP INSTALL / BUILD ========"
