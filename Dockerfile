FROM phusion/baseimage:0.9.16
MAINTAINER Rex Addiscentis <raddiscentis@addiscent.com>

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y php5-fpm php5-cli php5-curl php5-mysqlnd

COPY ./conf/php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY ./conf/www.conf /etc/php5/fpm/pool.d/www.conf
COPY ./conf/php.ini /etc/php5/fpm/php.ini

COPY ./conf/etc-cron.d-tab-for-phpfpm.txt /etc/cron.d/phpservermon
RUN chown root:root /etc/cron.d/phpservermon
RUN chmod 600 /etc/cron.d/phpservermon

RUN mkdir -p /var/www/public
COPY ./phpinfo.php /var/www/public/phpinfo.php
COPY ./phpservermon-3.1.1 /var/www/public
RUN touch /var/www/public/config.php
RUN chown -R www-data:www-data /var/www/public
RUN chmod -R 755 /var/www/public

RUN mkdir -p /etc/service/php-fpm
ADD start.sh /etc/service/php-fpm/run
RUN chmod +x /etc/service/php-fpm/run

EXPOSE 9000

VOLUME /var/www/public

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
