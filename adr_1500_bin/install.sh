#!/bin/sh

#copia archivo shared memory

echo "Installing config file adr_1500 ..."
sudo cp ./idac_iokeyfile /home/pi/
sudo cp ./idac_adr_serial.service /etc/systemd/system/
sudo cp ./idac_adr_client.service /etc/systemd/system/
sudo cp ./idac_adr_monitor_reset.service /etc/systemd/system/

#if  directory already exist 
if [ -d "/home/pi/idac_adr_bin/" ]; then
	echo "Directory /home/pi/idac_adr_bin/ already exist"
	#echo "Removing directory /home/pi/idac_bin/ ..."
	#rm -rf /home/pi/idac_bin/
	#echo "Make directory again..."
        #mkdir /home/pi/idac_bin/
else
	echo "Make directory.."
	mkdir /home/pi/idac_adr_bin/
fi

sudo systemctl stop idac_adr_serial.service
sudo systemctl stop idac_adr_client.service
sudo systemctl stop idac_adr_monitor_reset.service
#sudo systemctl daemon-reload

# copy exec and ask overwrite
cp adr_1500_serial /home/pi/idac_adr_bin/
cp Idac_Adr_1500_client_http /home/pi/idac_adr_bin/
cp idac_adr_monitor_reset /home/pi/idac_adr_bin/

#add permission exec - by default 644 -rw-r--r--
chmod +x /home/pi/idac_adr_bin/adr_1500_serial /home/pi/idac_adr_bin/Idac_Adr_1500_client_http /home/pi/idac_adr_bin/idac_adr_monitor_reset

sudo systemctl stop idac_adr_serial.service
sudo systemctl daemon-reload
sudo systemctl enable idac_adr_serial.service
sudo systemctl start idac_adr_serial.service

sudo systemctl stop idac_adr_client.service
sudo systemctl daemon-reload
sudo systemctl enable idac_adr_client.service
sudo systemctl start idac_adr_client.service

sudo systemctl stop idac_adr_monitor_reset.service
sudo systemctl daemon-reload
sudo systemctl enable idac_adr_monitor_reset.service
sudo systemctl start idac_adr_monitor_reset.service

sudo systemctl status idac_adr_serial.service
sudo systemctl status idac_adr_client.service
sudo systemctl status idac_adr_monitor_reset.service
#sudo pstree $(pidof monitor_process)
