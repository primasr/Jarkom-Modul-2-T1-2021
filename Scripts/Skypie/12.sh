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

        <Directory /var/www/super.franky.ti1.com/public>
            Options +Indexes
        </Directory>

        Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

        ErrorDocument 404 /error/404.html
        ErrorDocument 500 /error/404.html
        ErrorDocument 502 /error/404.html
        ErrorDocument 503 /error/404.html
        ErrorDocument 504 /error/404.html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

' > /etc/apache2/sites-available/super.franky.ti1.com.conf

service apache2 restart