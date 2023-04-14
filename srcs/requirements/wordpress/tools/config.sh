#!bin/bash
sleep 10
cd /var/www/wordpress
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create --dbhost=$DATABASE_HOST \
                    --dbname=$DATABASE_NAME \
                    --dbuser=$DATABASE_USER \
                    --dbpass=$DATABASE_PASSWORD \
                    --allow-root \
                    --path='/var/www/wordpress' \
                    --skip-check
    sleep 10
    wp core install --title=$WORDPRESS_TITLE \
                    --url=$WORDPRESS_URL \
                    --admin_user=$WORDPRESS_DB_ADMIN_USER \
                    --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD \
                    --admin_email=$WORDPRESS_DB_ADMIN_MAIL \
                    --allow-root \
                    --path='/var/www/wordpress'
    
    wp user create  --allow-root \
                    --role=author $WORDPRESS_DB_USER_NAME $WORDPRESS_DB_USER_MAIL \
                    --user_pass=$WORDPRESS_DB_USER_PASSWORD \
                    --path='/var/www/wordpress'
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

cd -


php-fpm7.3 -F