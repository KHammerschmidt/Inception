FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key -subj "/C=DE/ST=BW/L=Heilbronn/O=bruh/CN=khammers@42.fr/emailAddress=khammers@student.42heilbronn.de"
RUN chmod -R 644 /etc/ssl/private/nginx.key
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 433
COPY ./conf/my_nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]

#
#
#
# for testing purposes
# COPY index.html /usr/share/nginx/html/index.html
# CMD ["/bin/bash"]
# docker run -d -t -p 433:433 nginx
