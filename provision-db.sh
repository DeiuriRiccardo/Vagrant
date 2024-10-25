#!/bin/bash

 apt-get install -y mysql-server

 systemctl enable mysql

# Configuro MySQL per permettere la connessione da rete interna
sed -i "s/^bind-address\s*=.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

mysql -u root -e "CREATE DATABASE IF NOT EXISTS web_db;"

mysql -u root -e "CREATE USER IF NOT EXISTS 'webuser'@'%' IDENTIFIED BY 'webpass';"
mysql -u root -e "GRANT ALL PRIVILEGES ON web_db.* TO 'webuser'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -D web_db -e "CREATE TABLE IF NOT EXISTS persons (
    personID int,
    lastName varchar(255),
    firstName varchar(255),
    address varchar(255),
    city varchar(255)
);"

mysql -u root -D web_db -e "INSERT INTO persons (personID, lastName, firstName, address, city) VALUES
    (1, 'Rossi', 'Mario', 'Via Roma 1', 'Roma'),
    (2, 'Verdi', 'Luca', 'Via Milano 10', 'Milano'),
    (3, 'Bianchi', 'Giulia', 'Via Napoli 15', 'Napoli'),
    (4, 'Neri', 'Alessandro', 'Via Firenze 20', 'Firenze'),
    (5, 'Gialli', 'Sofia', 'Via Torino 25', 'Torino');"