FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

RUN mkdir-p /etc/nginx/ssl

RUN openssl req -newkey rsa:409 -days 365 -nodes -x509 \
    -subj "/C=DE/ST=Berlin/L=Berlin/0=42/OU=42/CN=edrouot.42.fr/UID=edrouot" \
    -out /etc/ssl/certs/inception.crt \
    -keyout /etc/ssl/private/inception.key

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
