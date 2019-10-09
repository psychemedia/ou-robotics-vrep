#!/bin/bash

#Hack for now
USER=vagrant
PASS=vagrant

#useradd -p $(openssl passwd -1 $PASS) $USER
adduser --disabled-password --gecos "" $USER
echo "$USER:$PASS" | chpasswd