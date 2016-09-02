sudo apt-get install apache2 screen php7 libapache2-mod-php7 php7-gd openjdk-8-jre git
mkdir server
chmod -R 777 server
git clone https://github.com/Alanaktion/MCHostPanel.git /var/www/html/MCHostPanel
sudo chmod -R 777 /var/www/html/MCHostPanel
cd /var/www/html/MCHostPanel/data/
cp config-sample.php config.php
