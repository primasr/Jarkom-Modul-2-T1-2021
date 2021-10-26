cp -n /etc/apache2/sites-available/franky.ti1.com.conf /etc/apache2/sites-available/super.franky.ti1.com.conf

echo '
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.ti1.com
        ServerName super.franky.ti1.com
        ServerAlias www.super.franky.ti1.com

         <Directory /var/www/super.franky.ti1.com>
             Options +FollowSymLinks -Multiviews
             AllowOverride All
         </Directory>

        Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/super.franky.ti1.com.conf

cp -R /var/www/franky.ti1.com /var/www/super.franky.ti1.com

a2ensite super.franky.ti1.com

service apache2 restart