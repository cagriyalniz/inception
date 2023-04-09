#Start mariadb server

/usr/bin/mysqld_safe --skip-grant-tables &

# wait for server to start
while ![["$(/usr/bin/mysqladmin -s -u root ping)" == "mysqld is alive"]]; do
    sleep 1
done

#create database and user
/usr/bin/mysql -u root << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser@'%';
FLUSH PRIVILEGES
EOF

#Stop mariadb server
/usr/bin/mysqladmin shutdown