#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#DEBUG TOOLS
#systemctl list-units | grep vrep
#journalctl -u vrep.service

VREPDIST="V-REP_PRO_EDU_V3_4_0_Linux"
VREPPATH="/opt/$VREPDIST"

VREPGZ="${VREPDIST}.tar.gz"
VREPSRC="http://coppeliarobotics.com/files/${VREPDIST}.tar.gz"

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
	tar -xzf /root/$VREPGZ -C /opt  && rm /root/$VREPGZ
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


#echo "VREP=${VREPPATH}" >> /etc/profile
#echo "VREP_LIBRARY=${VREPPATH}/programming/remoteApiBindings/lib/lib/64Bit/" >> /etc/profile
