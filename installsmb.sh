#!/bin/bash
file=/etc/samba/smb.conf

/bin/cat <<EOM >$file
[home]
path = /home/administrator
guest ok = yes
browseable = yes
read only = no
[www]
path = /var/www
guest ok = yes
browseable = yes
read only = no
EOM

sudo service samba reload
echo "DONE!"
