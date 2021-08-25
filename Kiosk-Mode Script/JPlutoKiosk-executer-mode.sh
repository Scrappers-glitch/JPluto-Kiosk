#!/bin/bash

echo "Executing JPluto Kiosk Mode "
echo "      <<<<<<<<<<<<<<<<<<<Powered By Scrappers<<<<<<<<<<<<<<<<<<<"

# 1 uninstalling plymouth application & deleting /usr/share/plymouth directory -> to disable boot splash screen
echo "Un-installing plymouth......................................."
sudo apt-get autoremove plymouth
echo "Deleting plymouth configuration & data files........................."
sudo apt-get purge plymouth
echo "Deleting plymouth dependencies...................."
sudo apt-get autoremove --purge plymouth

# 2 back-up & delete panel application from /usr/share/applications/panel
sudo mv '/usr/share/applications/mate-panel.desktop' '/home/jpluto/Fix Folder'

# 3 Customize the grub background 
echo "Customizing the grub........"
sudo cp '/home/jpluto/Fix Folder/grub-4x3.png' '/home/jpluto/Fix Folder/grub-16x9.png' '/home/jpluto/Fix Folder/grub_background.sh' '/etc/alternatives/desktop-theme/grub' 

# 4 installing grub-customizer applications .....after installing this applications >>> you will be able to configure & customize #your grub
echo "Installing grub-customizer"
sudo apt-get install grub-customizer
echo "Now customize your grub & exit it to continue setting up the kiosk mode"
grub-customizer
# 5 remove lockscreen
echo "Removing lockscreen for this user......................."
dconf write /org/gnome/desktop/screensaver/lock-enabled false
echo "Please add \"auth sufficient pam_succeed_if.so user ingroup nopasswdlogin\" before \"@include common-auth\" & save it w/o those quotation marks then exit the gedit editor......"
sudo gedit /etc/pam.d/lightdm
echo "Creating nopasswdlogin usergroup................."
sudo addgroup --system nopasswdlogin
echo "Adding jpluto to this group......................"
sudo adduser jpluto nopasswdlogin
echo "Add jpluto to the property autologin-user=jpluto in [Seat*] tag  to this file then save and exit......"
sudo gedit /etc/lightdm/lightdm.conf
# 6 removing other xsessions modes
sudo rm '/usr/share/xessions/gnome-session-remmina.desktop' '/usr/share/xessions/mate.desktop' 

echo "Finishing Setting-up Kiosk Mode >>>>>>>>>>>>"

#starting a bash prompt:
read -p "Script finished up . Do you want to reboot into JPluto-kiosk mode ? Y/y for yes & N/n for no ? " choice
    
    case "$choice" in
        y|Y ) reboot ;; 
        *   ) echo "Take a look at these commands then :-)"  ;;
    esac

echo ""
echo "You can use alt+t key combo to open the terminal while game is running ,
you can run any application from terminal using these commands :"
echo ""
echo "caja : for file manager caja
mate-tweak : for mate tweak window to customize panels & windows
mate-system-monitor : for system monitor
mate-display-properties : for displays & connected screens
mate-keybinding-properties : for keyboard shortcuts panel
mate-control-center : for control center(User Settings)
users-admin : for current users 
mate-session-properties : for start-up apps window panel"   
echo ""
read -p "Press enter to exit the Script >>>> >>>> >>>>" enter
#or use :
#if...else where -p is for prompt text & choice is the variable & fi for ending if statement
#read -p "Do you want to reboot into JPluto-kiosk mode ? Y/y for yes & N/n for no ? " choice
#if [ "$choice" = "y" | "$choice" = "Y" ]; then 
#    reboot;
#else
#    exit;
#fi

#script_ended

