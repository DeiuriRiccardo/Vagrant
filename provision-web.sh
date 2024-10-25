#!/bin/bash

apt-get install -y apache2

apt-get install -y php libapache2-mod-php php-mysql

chown -R www-data:www-data /var/www/html

# DEBIAN_FRONTEND=noninteractive permette di saltare richieste di input,
# utilizzato in script automatizzati.
DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin

cp ./website/* /var/www/html

# collego phpMyAdmin ad Apache creando un link simbolico
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

systemctl restart apache2
