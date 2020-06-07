FROM php:7.4-apache

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN groupadd apache-www-volume -g 1000
RUN useradd apache-www-volume -u 1000 -g 1000

RUN apt-get update \
    && apt-get install -y \
        nmap \
        vim
        
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli\
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo 'xdebug.remote_enable=on' >> /usr/local/etc/php/conf.d/xdebug.ini 


CMD ["apache2-foreground"]