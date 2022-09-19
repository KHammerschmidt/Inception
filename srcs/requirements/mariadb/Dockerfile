FROM debian:buster

RUN apt-get update -y
RUN apt-get install mariadb-server -y
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN service mysql start \
	&& mysql -u root -e "USE mysql"\
	&& mysql -u root -e "FLUSH PRIVILEGES" \
	&& mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD')" \
	&& mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}" \
	&& mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'' IDENTIFIED BY '${DB_PASSWORD}'" \
	&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@''"  \
	&& mysql -u root -e "FLUSH PRIVILEGES"

CMD mysqld_safe






