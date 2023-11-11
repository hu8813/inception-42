FROM debian:bookworm-slim

RUN	apt-get update -y && \
	apt-get install -y	\
	curl \
	mariadb-client \
	php8.2 \
	php8.2-fpm \
	php8.2-curl \
	php8.2-mysql \
	php8.2-mbstring \
	php8.2-xml \
	php8.2-zip \
	php8.2-gd \
	php8.2-imap

RUN mkdir -p /run/php
RUN	mkdir -p /var/www/html 
RUN chown -R www-data:www-data /var/www/html/

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/script.sh /usr/local/bin/

EXPOSE 9000

ENTRYPOINT ["script.sh"]

CMD ["php-fpm8.2", "-F"]
