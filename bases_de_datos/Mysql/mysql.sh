#!/usr/bin/env bash

echo "purge everything before starting"

sudo apt-get remove --purge *mysql*
sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt-get remove --purge *mariadb*
sudo apt-get autoremove
sudo apt-get autoclean

echo "purge succefully"

sleep 2

echo " verified that both MySQL and MariaDB (if installed previously)were removed"

dpkg -l | grep mariadb
dpkg -l | grep mysql

sleep 2

echo "Now to fix all broken repositories"

sudo apt-get install -f

echo "Now Upgrading the Repositories"

sudo apt update -y
sudo apt upgrade -y

sleep 2

echo "upgrade succefully"

echo "install mysql"

sudo apt install mysql-server

# reset password default MySQL V8

# Start MySQL without grant tables option. This will allow us to login to MySQL as a root user without a password:
sudo systemctl stop mysql
sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld
sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking &

# Confirm that the MySQL daemon is up and running:

ps aux | grep mysqld

# At this point, login to MySQL should not require any password:

mysql -u root

# these commands are entered in the mysql shell

FLUSH PRIVILEGES;
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'your password here';
quit

# solution to problem 1524
sudo /etc/init.d/mysql stop
sudo mysqld_safe --skip-grant-tables &
# enter -> go
mysql -uroot 

# these commands are entered in the mysql shell
use mysql;
update user set authentication_string=PASSWORD("your password here") where User='root';
update user set plugin="mysql_native_password" where User='root';
flush privileges;
quit;

sudo pkill mysqld
sudo service mysql start
sudo service mysql status

mysql -u root -p

#enter your password
---------------------------

#if you have this message as a response (Your password does not satisfy the current policy requirements), run these commands

SHOW VARIABLES LIKE 'validate_password%';

# check the row: validate_password.policy, and confirm what level it has, it can be: low, medium or high.
# you can lower the level or raise the level for your password with the following command:

# these commands are entered in the mysql shell
SET GLOBAL validate_password.policy = LOW;
SET GLOBAL validate_password.length = 6;
SET GLOBAL validate_password.number_count = 0;

# enter the command to change the password one more time

ALTER USER 'root'@'localhost' IDENTIFIED BY 'your password here';

# it could be something like this:
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root@root';

quit

# Restart the MySQL server:

sudo pkill mysqld
sudo service mysql start

# At this point you should be able to login to the MySQL server with the password as set in the

mysql -u root -p

# or you can enter as follows:
mysql -u root --password='root@root'
