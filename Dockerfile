FROM php:7-fpm

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

ARG XDEBUG_INI=/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo "xdebug.default_enable = off" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_enable = on" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_autostart = true" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_connect_back = off" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_port = 9000" >> ${XDEBUG_INI} \
    && echo "xdebug.remote_host = 172.17.0.1" >> ${XDEBUG_INI} \
    && echo "xdebug.idekey=VSCODE" >> ${XDEBUG_INI}

RUN docker-php-ext-install mysqli