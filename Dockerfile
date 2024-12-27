FROM ubuntu/apache2
COPY ./index.html /var/www/html/index.html
COPY ./Untitled-2.png /var/www/html/Untitled-2.png
COPY ./localhost.crt /etc/ssl/certs/localhost.crt
COPY ./localhost.key /etc/ssl/private/localhost.key
COPY ./my-httpd-vhosts.conf /etc/apache2/sites-available/my-ssl.conf
RUN a2enmod ssl && \
    a2enmod rewrite && \
    a2dissite 000-default default-ssl && \
    a2ensite my-ssl
