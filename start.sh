apt-get update

echo -e "Install git"
apt-get install -y git

echo -e "Install mysql"
apt-get install -y mysql-server
mysql --skip-column-names -B -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'toor';"
mysql -B -e "CREATE DATABASE 'locker_cms';"

echo -e "Install php"
apt-get install -y php libapache2-mod-php php-mysql

echo -e "Install composer"
cd /tmp
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo -e "Install nodejs"
apt-get install nodejs -y
npm install -g npm@latest

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