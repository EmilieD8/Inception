FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -sha256 \
    -subj "/C=DE/ST=Berlin/L=Berlin/O=42/OU=42/CN=edrouot.42.fr/UID=edrouot" \
    -out /etc/nginx/ssl/edrouot.crt \
    -keyout /etc/nginx/ssl/edrouot.key

COPY /conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN mkdir /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]