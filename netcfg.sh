#!/bin/bash
#
###########################################
# Get Info
#
getinfo(){
  read -p "Enter the ip address for your server: (looks like 192.168.1.22)  " staticip
  read -p "Enter the netmask for your network:   (looks like 255.255.255.0) " netmask
  read -p "Enter the IP of your router:          (looks like 192.168.1.1)   " routerip
}
#
#
##############################################
# Write the settings to the Interface
#
writeinterfacefile(){
cat << EOF > $1
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
# The loopback network interface
auto lo
iface lo inet loopback
# The primary network interface
auto eth0
#iface eth0 inet dhcp

#Your static network configuration
iface eth0 inet static
address $staticip
netmask $netmask
gateway $routerip
dns-nameservers 208.67.222.222 208.67.220.220

#New standard for interfaces 
auto ens160
iface ens160 inet static 
address $staticip 
netmask $netmask 
gateway $routerip 
dns-nameservers 208.67.222.222 208.67.220.220 


EOF
#don't use any space before of after 'EOF' in the previous line
  echo ""
  echo "Your informatons was saved in '$1' file."
  echo ""

  exit 0
}
#
##################################################

file="/etc/network/interfaces"
if [ ! -f $file ]; then
  echo ""
  echo "The file '$file' doesn't exist!"
  echo ""
  exit 1
fi

clear
echo "Let's set up a static ip address for your site"
echo ""

getinfo
echo ""
echo "So your settings are:"
echo "Address of your Router is:   $routerip"
echo "The Mask for the Network is: $netmask"
echo "Your decided Server IP is:   $staticip"
echo ""

while true; do
  read -p "Is this information correct? [y/n]: " yn 
  case $yn in
    [Yy]* ) writeinterfacefile $file;;
    [Nn]* ) getinfo;;
        * ) echo "Pleas enter y or n!";;
  esac
done
