#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#DEBUG TOOLS
#systemctl list-units | grep vrep
#journalctl -u vrep.service


VREPGZ="V-REP_PRO_EDU_V3_4_0_Linux.tar.gz"
VREPSRC="http://coppeliarobotics.com/files/V-REP_PRO_EDU_V3_4_0_Linux.tar.gz"

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
	#Unpacks to: /opt/openrefine-2.7
	touch /opt/vrep.done
	echo "...unpacked V-Rep"
else
	echo "...already downloaded and unpacked V-Rep"
fi


#Service definition to run application
#cp $THISDIR/services/vrep.service /lib/systemd/system/vrep.service
	
# Enable autostart
#systemctl enable vrep.service

# Refresh service config
#systemctl daemon-reload

#(Re)start service
#systemctl restart vrep.service
