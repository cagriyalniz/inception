FROM debian:buster

RUN apt-get update && \
	apt-get install -y wget \
	php7.3-fpm php7.3-mysql \
	mariadb-client curl && \
	rm -rf /var/lib/apt/lists/*


RUN wget https://tr.wordpress.org/latest-tr_TR.tar.gz -P /var/www

# -x: Sıkıştırılmış dosyaların çıkarılması için kullanılır.
# -v: İşlem sırasında çıktıların görüntülenmesini sağlar.
# -f: İşlem yapılacak dosya veya arşiv belirtilir.
# -z: Sıkıştırılmış dosyanın gzip veya gunzip ile sıkıştırılmış olduğunu belirtir.

RUN cd /var/www && tar -xvzf latest-tr_TR.tar.gz && rm -rf latest-tr_TR.tar.gz && \
	chown -R root:root /var/www/wordpress
# chown komutu kullanılarak /var/www/wordpress dizinin sahibi ve grubu root olarak ayarlanıyor.
# chown komutunun işleminin rekürsif olacağını (yani belirtilen dizinin altındaki tüm alt dizinler ve dosyalar için geçerli olacağını) belirtir.

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	--output /usr/local/bin/wp --silent && \
	chmod +x /usr/local/bin/wp
# WP-CLI (Wordpress Command Line Interface) aracını indiriyor

EXPOSE 9000

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/config.sh /

RUN chmod +x config.sh

CMD ["sh", "config.sh"]