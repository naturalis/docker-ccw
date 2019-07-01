FROM php:7.0-apache

MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>
LABEL Description="LAMP stack, modified for naturalis ccw application." 

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        locales-all \
        libpng-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install and activate php and apache modules
RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli && \
    docker-php-ext-install gd && \
    a2enmod rewrite

# add files into container
ADD config/php.ini /usr/local/etc/php/
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD htaccess /tmp/htaccess

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
