FROM alpine:3.14

RUN apk update && apk upgrade

#Mariadb veritabanı sunucusunu ve client uygulamasını yükler. Ayrıca, OpenRC sistem yöneticisini yükler. OpenRC, servislerin (örneğin, veritabanı sunucusu) başlatılması, durdurulması ve yönetilmesi gibi işlemler icin
RUN apk add mariadb mariadb-client openrc

COPY ./tools/setup.sh /tmp/
COPY ./tools/my.cnf /etc/mysql/

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

CMD ["/tmp/setup.sh"]