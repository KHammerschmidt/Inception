FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key -subj "/C=DE/ST=BW/L=Heilbronn/O=bruh/CN=khammers@42.fr/emailAddress=khammers@student.42heilbronn.de"
RUN chmod -R 644 /etc/ssl/private/nginx.key

EXPOSE 443
COPY ./conf/default /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]