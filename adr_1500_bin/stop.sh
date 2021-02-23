#!/bin/sh

echo "Stop process serial, client, monitor reset ..."
sudo systemctl stop idac_adr_serial.service
sudo systemctl stop idac_adr_client.service
sudo systemctl stop idac_adr_monitor_reset.service