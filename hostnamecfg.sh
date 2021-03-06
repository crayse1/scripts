#!/bin/bash

getinfo(){
  read -p "Please enter the name of your host: (looks like SERVER-1)  " srvhostname
}
writehost(){
cat << EOF > $file1
$srvhostname
EOF
#don't use any space before of after 'EOF' in the previous line
cat << EOF > $file2
127.0.0.1       localhost
127.0.1.1       $srvhostname

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
  
  echo ""
  echo " '$srvhostname' saved in '$file1' file."
  echo " '$srvhostname' saved in '$file2' file."
  echo ""
  exit 0
}
##################################################
getinfo
file1="/etc/hostname"
file2="/etc/hosts"
writehost
 
done
