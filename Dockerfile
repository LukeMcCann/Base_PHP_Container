FROM php:7.4-apache

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN groupadd apache-www-volume -g 1000
RUN useradd apache-www-volume -u 1000 -g 1000

CMD ["apache2-foreground"]