#!/bin/bash

SPLUNK_VERSION="9.4.0"
SPLUNK_URL="https://download.splunk.com/products/universalforwarder/releases/9.4.0/linux/splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz"
INSTALL_DIR="/opt/splunkforwader"

wget -O splunkforwader.tgz "$SPLUNK_URL"

export SPLUNK_HOME="/opt/splunkforwarder"

mkdir $SPLUNK_HOME

sudo tar -xvzf splunkforwarder.tgz -C /opt/

cd /opt/splunkforwarder/bin/bash

./splunk enable boot-start

./splunk add forward-server 172.20.241.20:8000

./splunk add monitor /var/log

./splunk restart
