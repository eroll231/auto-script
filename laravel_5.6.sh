cd
sudo apt-get update
sudo apt-get upgrade -y


echo "###################################[ 1 ]###################################"


sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install apache2 libapache2-mod-php7.2 php7.2 php7.2-bcmath php7.2-cli php7.2-common php7.2-curl php7.2-dev php7.2-gd php7.2-json php7.2-mysql php7.2-mbstring php7.2-xml php7.2-zip


echo "###################################[ 2 ]###################################"
echo "mysql-server mysql-server/root_password password hive1234" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password hive1234" | sudo debconf-set-selections
sudo apt install mysql-server mysql-client -y



sudo apt install mysql-server mysql-client -y


echo "###################################[ 3 ]###################################"
cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer





echo "###################################[ 4 ]###################################"
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo su
sudo echo "/swapfile swap swap defaults 0 0  LABEL=cloudimg-rootfs   /        ext4   defaults        0 0" > /etc/fstab 
exit



echo "###################################[ 5 ]###################################"
sudo composer global require laravel/installer
cd /var/www/html
# sudo composer create-project laravel/laravel laravelProject --prefer-dist
sudo composer create-project --prefer-dist laravel/laravel laravelProject "5.6.*"





echo "###################################[ 6 ]###################################"
sudo chgrp -R www-data /var/www/html/laravelProject/
sudo chmod -R 775 /var/www/html/laravelProject/




echo "###################################[ 7 ]###################################"
cd /etc/apache2/sites-available
sudo touch laravel.conf



echo "###################################[ 8 ]###################################"
sudo su
echo '
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html/laravelProject/public

        <Directory /var/www/html/laravelProject>
            Options +FollowSymLinks -Indexes
            RewriteEngine On

            RewriteCond %{REQUEST_FILENAME} !-d
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^ index.php [L]
       </Directory>
        
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' >| /etc/apache2/sites-available/laravel.conf
exit


sudo a2dissite 000-default.conf
sudo a2ensite laravel.conf
sudo a2enmod rewrite
sudo service apache2 restart


echo "###################################[ 9 ]###################################"
clear
ifconfig
echo "Done, copy your IP and paste to url";




