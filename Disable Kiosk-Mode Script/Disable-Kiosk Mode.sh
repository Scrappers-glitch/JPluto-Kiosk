#!/bin/bash

echo "POWERED By SCRAPPERS"
echo ""
echo "Script to disable the kiosk Mode.............."

#copy the panel app to the /usr/share/applications dir
sudo cp '/home/jpluto/Fix Folder/mate-panel.desktop' '/usr/share/applications'
#rebooting system to apply chages
reboot
