a2enmod rewrite
service apache2 restart

echo '
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ $1.php [NC,L]
' > /var/www/franky.ti1.com/.htaccess

echo '
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.ti1.com
        ServerName franky.ti1.com
        ServerAlias www.franky.ti1.com

         <Directory /var/www/franky.ti1.com>
             Options +FollowSymLinks -Multiviews
             AllowOverride All
         </Directory>

        Alias "/index.php" "/var/www/franky.ti1.com/index.php"

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/franky.ti1.com.conf

service apache2 restart