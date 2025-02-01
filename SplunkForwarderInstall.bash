#!/bin/bash

SPLUNK_VERSION="9.4.0"
SPLUNK_URL="https://download.splunk.com/products/universalforwarder/releases/9.4.0/linux/splunkforwarder-9.4.0-6b4ebe426ca6-linux-amd64.tgz"
INSTALL_DIR="/opt/splunkforwader"

wget -O splunkforwader.tgz "$SPLUNK_URL"

sudo tar -xvzf splunkforwarder.tgz -C /opt/

sudo mv /opt/splunkforwarder-* "$INSTALL_DIR"

sudo $INSTALL_DIR/bin/splunk enable boot-start --accept-license --answer-yes --no-prompt

sudo $INSTALL_DIR/bin/splunk start

sudo $INSTALL_DIR/bin/splunk/status