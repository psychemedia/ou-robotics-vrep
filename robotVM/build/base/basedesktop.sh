#!/usr/bin/env bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#Install base python packages
#apt-get update && apt-get install -y ubuntu-desktop && apt-get clean
apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop && apt-get install -y gnome-terminal unity-lens-applications unity-lens-files && apt-get clean


#Autologin
#https://askubuntu.com/a/51087
cp $THISDIR/etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf



#Desktop config settings to run at every boot
cp $THISDIR/scripts/set-gnome-settings.sh /opt/set-gnome-settings.sh 
chmod +x /opt/set-gnome-settings.sh 
cp -r $THISDIR/home/vagrant/.config/autostart/. /home/vagrant/.config/autostart/
chmod +x /home/vagrant/.config/autostart/*.desktop