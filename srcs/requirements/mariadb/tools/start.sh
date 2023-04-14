#!/bin/bash
service mysql start

#creates a new database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
#To specify any valid host, replace 'localhost' with '%'.
# '%' herhangi bir IP adresinden gelen bağlantıları kabul edeceği anlamına gelir.
mysql -e "CREATE USER IF NOT EXISTS \`${DATABASE_USER}\`@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';"
#It applies to all tables of that database, which is indicated by the .* that follows.
mysql -e "GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO \`${DATABASE_USER}\`@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
#Following any updates to the user privileges, be sure to save the changes
mysql -e "FLUSH PRIVILEGES;"

mysqld
#Bu komut, sunucunun yapılandırmasını okur ve belirtilen yapılandırmaya göre bir MySQL veya MariaDB sunucusu çalıştırır. 
