sudo apt-get update
sudo apt-get upgrade
sudo apt-get install erlang
sudo apt-get install rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
sudo systemctl status rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user username password
sudo rabbitmqctl set_user_tags username administrator
sudo rabbitmqctl set_permissions -p / username ".*" ".*" ".*"

install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

add this on composer.json
{
    "require": {
        "php-amqplib/php-amqplib": ">=2.9.0"
    }
}

php composer.json

to check
open port 15672
browse site: ipaddress:15672

to add channel
go to ipaddress:15672
	queues > add new queue
