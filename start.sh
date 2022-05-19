
Green='\033[32m'  # Green
YELLOW='\033[33m' # YELLOW
CLEAR='\033[0m'   # Clear color and formatting

apt update

echo -e "${YELLOW}Install git${CLEAR}"
apt install -y git

echo -e "${YELLOW}Install mysql${CLEAR}"
apt install -y mysql-server
service mysql start
mysql --skip-column-names -B -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'toor';"
mysql -uroot -ptoor -B -e "CREATE DATABASE locker_cms;"

echo -e "${YELLOW}Install php${CLEAR}"
apt install -y php libapache2-mod-php php-mysql

echo -e "${YELLOW}Install curl${CLEAR}"
apt install curl -y

echo -e "${YELLOW}Install composer${CLEAR}"
cd /tmp
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo -e "${YELLOW}Install nodejs${CLEAR}"
apt install nodejs -y

echo -e "${YELLOW}Install npm${CLEAR}"
apt-get install npm -y
npm install -g npm@latest

echo -e "${YELLOW}clone Project${CLEAR}"
echo -e "${YELLOW}Laravel${CLEAR}"
cd /home
git clone https://github.com/rj1110634028/MonoLuck-CMS-Back.git
cd ./MonoLuck-CMS-Back
git checkout -b release
git pull origin release
apt install php-xml
composer install --ignore-platform-reqs
composer update

echo -e "${YELLOW}React${CLEAR}"
cd /home
git clone https://github.com/leonnn124/luck-cms.git
cd ./luck-cms
npm install