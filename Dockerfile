FROM php:7.4-apache

RUN apt-get update
RUN apt-get install git -y
RUN apt-get install zip unzip -y

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable apache modules
RUN a2enmod rewrite headers && a2enmod rewrite