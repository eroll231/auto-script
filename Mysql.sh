
echo "############################################################"
echo "############################################################"
echo "######################|---------------|#####################"
echo "######################| Install MySQL |#####################"
echo "######################|---------------|####################"
echo "############################################################"
echo "############################################################"
echo "mysql-server mysql-server/root_password password hive1234" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password hive1234" | sudo debconf-set-selections
sudo apt install mysql-server mysql-client -y

clear
echo "Now install a module, base on your php version";
echo "Done !"
echo "usr: root"
echo "pwd: hive1234"

