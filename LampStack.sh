sudo locale-gen "en_US.UTF-8"
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo dpkg-reconfigure locales

echo "Installing Apache2"
sudo apt install apache2 -y

echo "Installing Apache2 Library"
sudo apt install php libapache2-mod-php -y

echo "Installing unzip, git, curl"
sudo apt install unzip git curl -y

echo "Installing Php7.0"
sudo apt install php7.0 -y

echo "Install MySQL Server in a Non-Interactive mode. Default root password will be root"
echo "mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt install mysql-server mysql-client -y

echo "Installing Modules"
sudo apt-get install php7.0-bcmath php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-gd php7.0-json php7.0-json php7.0-mcrypt php7.0-mysql php7.0-mbstring php7.0-xml php7.0-zip -y

echo "Configuring mode"
sudo chmod -R 775 /var/www/html
sudo chown -R www-data:www-data /var/www/html
