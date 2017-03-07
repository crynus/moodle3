#!/bin/bash
#Actualizaremos los repositorios e instalaremos todas las dependencias
apt-get update
apt-get install apache2 mysql-client mysql-server php5 git -y
apt-get install graphviz aspell php5-pspell php5-curl php5-gd php5-intl php5-mysql php5-xmlrpc php5-ldap -y
service apache2 restart
cd /opt
#Descargar el Código de Moodle y el Índice
git clone git://git.moodle.org/moodle.git
#Cambiar de directorio hacia la carpeta del Moodle descargado
cd moodle
#Recuperar una lista de cada una de las ramas disponibles
git branch -a
#Decirle a git cual de las ramas deberá de monitorear o usar
git branch --track MOODLE_30_STABLE origin/MOODLE_30_STABLE
#Finalmente, traernos la versión de Moodle especificada
git checkout MOODLE_30_STABLE
# Ahora crearemos la base de datos que usaremos
mysql -u root -p1468 -e "CREATE DATABASE moodle DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root -p1468 -e "create user 'moodledude'@'localhost' IDENTIFIED BY 'passwordformoodledude';"
mysql -u root -p1468 -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO moodledude@localhost IDENTIFIED BY 'passwordformoodledude';"
#Ahora copiaremos la carpeta que hemos descargado y crearemos el directorio moodledata
cp -R /opt/moodle /var/www/html/
mkdir /var/moodledata
#Permisos
chown -R www-data /var/moodledata
chmod -R 777 /var/moodledata
chmod -R 0755 /var/www/html/moodle
