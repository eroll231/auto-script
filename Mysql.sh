
echo "############################################################"
echo "############################################################"
echo "######################|---------------|#####################"
echo "######################| Install MySQL |#####################"
echo "######################|---------------|####################"
echo "############################################################"
echo "############################################################"
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt install mysql-server mysql-client -y

echo "Now install a module, base on your php version";
