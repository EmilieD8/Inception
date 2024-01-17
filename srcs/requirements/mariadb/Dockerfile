FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/auto_config.sh auto_config.sh

RUN chmod +x auto_config.sh

EXPOSE 3306

RUN ./auto_config.sh

CMD ["mysqld"]
