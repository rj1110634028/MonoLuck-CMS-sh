sudo apt-get update

echo -e "Install git"
sudo apt-get install -y git

echo -e "Install mysql"
sudo apt-get install -y mysql-server
sudo mysql --skip-column-names -B -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'toor';"
sudo mysql -B -e "CREATE DATABASE 'locker_cms';"

echo -e "Install php"
sudo apt-get install -y php libapache2-mod-php php-mysql

echo -e "Install composer"
cd /tmp
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo -e "Install nodejs"
sudo apt-get install nodejs -y
sudo npm install -g npm@latest

echo -e "clone Project"
echo -e "Laravel"
cd /home
git clone https://github.com/rj1110634028/MonoLuck-CMS-Back.git
cd ./MonoLuck-CMS-Back
composer install

echo -e "React"
cd /home
git clone https://github.com/leonnn124/luck-cms.git
cd ./luck-cms
npm install