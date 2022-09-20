FROM debian:buster

# Installation of mariadb, curl and php
RUN apt-get update -y
RUN apt-get install -y \
	php7.3-fpm php7.3-mysql \
	mariadb-client \
	wget curl

# Change listen parameter to wordpress:9000
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Wordpress installation & setting configurations
WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xvzf latest.tar.gz \
	&& rm -rf latest.tar.gz
COPY ./conf/wp-config.php ./wordpress

RUN mkdir /run/php
RUN touch /run/php/php7.3-fpm.pid

EXPOSE 9000

# run php-fpm7.3 listening for CGI request and force to stay in the foreground and ignore daemonize option from configuration file
CMD php-fpm7.3 -F