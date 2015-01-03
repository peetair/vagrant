DBPASSWD=root

echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections
sudo apt-get update
sudo apt-get -y install mysql-server-5.5

mysql -uroot -p$DBPASSWD -e "grant all privileges on *.* to 'root'@'localhost' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "grant all privileges on *.* to 'root'@'%' identified by '$DBPASSWD'"
sudo sed -i '/127.0.0.1/c\bind-address = 0.0.0.0' /etc/mysql/my.cnf
sudo service mysql restart
