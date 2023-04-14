FROM debian:10.12

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start.sh /start.sh

RUN chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf;

EXPOSE 3306

CMD bash 'start.sh'; 'bash'

#CMD sleep infinity