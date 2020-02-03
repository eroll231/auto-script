cd
sudo apt update

echo "############################################################"
echo "############################################################"
echo "######################|-----------|#########################"
echo "######################| Languages |#########################"
echo "######################|-----------|#########################"
echo "############################################################"
echo "############################################################"
sudo locale-gen "en_US.UTF-8"

sudo su
echo -e 'LANG="en_US.UTF-8" \n LANGUAGE="en_US.UTF-8" \n LC_ALL="en_US:en_US.UTF-8" \n ' > /etc/default/locale
exit



echo "############################################################"
echo "############################################################"
echo "######################|-----------------|###################"
echo "######################| Install MongoDB |###################"
echo "######################|-----------------|###################"
echo "############################################################"
echo "############################################################"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt update
sudo apt install mongodb -y
sudo systemctl enable mongodb
sudo systemctl start mongodb
sudo systemctl stop mongodb
sudo systemctl restart mongodb


echo "############################################################"
echo "############################################################"
echo "##################|--------------------|####################"
echo "##################| Installing Apache2 |####################"
echo "##################|--------------------|####################"
echo "############################################################"
echo "############################################################"
sudo apt install apache2 -y


echo "############################################################"
echo "############################################################"
echo "##############|----------------------------|################"
echo "##############| Installing Apache2 Library |################"
echo "##############|----------------------------|################"
echo "############################################################"
echo "############################################################"
sudo apt install php libapache2-mod-php -y


echo "############################################################"
echo "############################################################"
echo "###############|-----------------------------|##############"
echo "###############| Installing unzip, git, curl |##############"
echo "###############|-----------------------------|##############"
echo "############################################################"
echo "############################################################"
sudo apt install unzip git curl -y


echo "############################################################"
echo "############################################################"
echo "####################|---------------------|#################"
echo "####################| Installing composer |#################"
echo "####################|---------------------|#################"
echo "############################################################"
echo "############################################################"
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
unlink composer-setup.php


echo "############################################################"
echo "############################################################"
echo "##################|-------------------|####################"
echo "##################| Installing Php7.0 |#####################"
echo "##################|-------------------|#####################"
echo "############################################################"
echo "############################################################"
sudo apt install php7.0 -y


echo "############################################################"
echo "############################################################"
echo "###################|--------------------|###################"
echo "###################| Installing Modules |###################"
echo "###################|--------------------|###################"
echo "############################################################"
echo "############################################################"
sudo apt-get install php7.0-bcmath php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-gd php7.0-json php7.0-json php7.0-mcrypt php7.0-mbstring php7.0-xml php7.0-zip -y
sudo apt install php-pear php-mongodb -y

echo "############################################################"
echo "############################################################"
echo "#####################|------------------|###################"
echo "#####################| Installing Yii2  |###################"
echo "#####################|------------------|###################"
echo "############################################################"
echo "############################################################"
wget https://github.com/yiisoft/yii2/releases/download/2.0.32/yii-advanced-app-2.0.32.tgz
echo "Done."


echo "############################################################"
echo "############################################################"
echo "#####################|------------------|###################"
echo "#####################| Extracting Yii2  |###################"
echo "#####################|------------------|###################"
echo "############################################################"
echo "############################################################"
tar -xvzf yii-advanced-app-2.0.32.tgz
echo "Done."


echo "############################################################"
echo "############################################################"
echo "#########|---------------------------------------|##########"
echo "#########| Moving path into /var/www/html  Yii2  |##########"
echo "#########|---------------------------------------|##########"
echo "############################################################"
echo "############################################################"
cd /var/www/html
sudo rm -rf advanced
cd
sudo mv advanced/ /var/www/html/
echo "Done."

echo "############################################################"
echo "############################################################"
echo "####################|-------------------|###################"
echo "####################| Configuring Yii2  |###################"
echo "####################|-------------------|###################"
echo "############################################################"
echo "############################################################"
cd /var/www/html/advanced/

rm composer.lock 
composer install
sudo su
echo '
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html/advanced/backend/web
        
         <Directory "/var/www/html/advanced/backend/web">
           # use mod_rewrite for pretty URL support
           RewriteEngine on
           # If a directory or a file exists, use the request directly
           RewriteCond %{REQUEST_FILENAME} !-f
           RewriteCond %{REQUEST_FILENAME} !-d
           # Otherwise forward the request to index.php
           RewriteRule . index.php
           # use index.php as index file
           DirectoryIndex index.php
       # ...other settings...
       </Directory>
        
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' >| /etc/apache2/sites-available/000-default.conf
exit

sudo a2enmod rewrite
sudo service apache2 restart
echo "Done."

echo "############################################################"
echo "############################################################"
echo "#####################|------------------|###################"
echo "#####################| Configuring mode |###################"
echo "#####################|------------------|###################"
echo "############################################################"
echo "############################################################"
sudo chmod -R 775 /var/www/html
sudo chown -R www-data:www-data /var/www/html

clear

echo "############################################################"
echo "############################################################"
echo "###############|---------------------------|################"
echo "###############|  Ready for Initialization |################"
echo "###############|---------------------------|################"
echo "############################################################"
echo "############################################################"
echo "COPY AND RUN THIS CODE >>    sudo /var/www/html/advanced/./init"
