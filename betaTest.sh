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
echo "##################|-----------------------|#################"
echo "##################| Creating User MongoDB |#################"
echo "##################|-----------------------|#################"
echo "############################################################"
echo "############################################################"

mongo

use admin

db.createUser(
  {
    user: "admin",
    pwd: "hive1234",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

exit

mongod --port 27017 -u "admin" -p "hive1234" --authenticationDatabase "admin"

use test

db.createUser(
  {
    user: "user",
    pwd: "hive1234",
    roles: [ { role: "readWrite", db: "test" } ]
  }
)
exit
ech0 "Success.";
