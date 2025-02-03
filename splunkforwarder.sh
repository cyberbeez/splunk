#!/bin/bash

#Written by Cameron Marquardt & Red Teamer John

##Grab File
sudo wget "https://download.splunk.com/products/universalforwarder/releases/9.4.0/linux/splunkforwar$
##Move File
sudo mv ./splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz /opt/ 

cd /opt
##Unpack
sudo tar -xvzf splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz
##Accept Lis.
sudo /opt/splunkforwarder/bin/splunk start --accept-license

cd /opt/splunkforwarder/bin/
##Start on Boot
sudo ./splunk enable boot-start
##Make sure to type home IP for splunk when running for the pos arg.
sudo ./splunk add forward-server $1:8000
##Set Monitor
sudo ./splunk add monitor /var/log/
##
sudo ./splunk restart
