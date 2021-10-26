echo '
<VirtualHost *:80>
        Redirect 301 / http://www.franky.ti1.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/000-default.conf

service apache2 restart