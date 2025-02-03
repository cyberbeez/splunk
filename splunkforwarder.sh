!/bin/bash

#Written by Cameron Marquardt & Red Teamer John

##Grab File
sudo wget "https://download.splunk.com/products/universalforwarder/releases/9.4.0/linux/splunkforwar$
##Move File
sudo mv ./splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz /opt/ 

cd /opt
##Unpack
sudo tar -xvzf splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz

sudo /opt/splunkforwarder/bin/splunk start --accept-license

#Shouldn't be there :( (Gathers computer IPv4 address, excludes loopback)
#ip -4 addr show | grep -oP 'inet \K[\d.]+' | grep -v '^127\.0\.0\.1$'

cd /opt/splunkforwarder/bin/

sudo ./splunk enable boot-start

sudo ./splunk add forward-server $1:8000

sudo ./splunk add monitor /var/log/

sudo ./splunk restart
