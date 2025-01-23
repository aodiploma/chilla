FROM ubuntu/apache2
COPY ./index.html /var/www/html/index.html
COPY ./images/v533_48.png /var/www/html/images/v533_48.png
COPY ./images/v533_52.png /var/www/html/images/v533_52.png
COPY ./images/v533_59.png /var/www/html/images/v533_59.png
COPY ./images/v533_64.png /var/www/html/images/v533_64.png
COPY ./localhost.crt /etc/ssl/certs/localhost.crt
COPY ./localhost.key /etc/ssl/private/localhost.key
COPY ./my-httpd-vhosts.conf /etc/apache2/sites-available/my-ssl.conf
RUN a2enmod ssl && \
    a2enmod rewrite && \
    a2dissite 000-default default-ssl && \
    a2ensite my-ssl
