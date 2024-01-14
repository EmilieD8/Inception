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
    && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm -rf wordpress-6.4.2.tar.gz

COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh

RUN chmod +x /usr/local/bin/auto_config.sh

RUN /usr/local/bin/auto_config.sh

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ["sleep", "infinity"]