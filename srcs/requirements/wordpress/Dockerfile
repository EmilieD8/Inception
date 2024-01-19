FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget

RUN apt-get install -y php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
    php-xml \
    mariadb-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www/

RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm -rf wordpress-6.4.2.tar.gz

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent 

RUN chmod +x /usr/bin/wp

RUN mkdir /run/php

COPY ./conf/auto_config.sh /var/www/wordpress/auto_config.sh

RUN chmod +x /var/www/wordpress/auto_config.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

CMD ["bash", "./auto_config.sh"]
