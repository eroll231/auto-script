sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt update

sudo apt install mongodb-org

sudo systemctl enable mongod
sudo systemctl start mongod 
sudo systemctl stop mongod
sudo systemctl restart mongod 
