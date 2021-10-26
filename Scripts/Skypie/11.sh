rm -rf /var/www/super.franky.ti1.com

unzip /root/Praktikum-Modul-2-Jarkom/super.franky.zip -d /var/www/super.franky.ti1.com

mv /var/www/super.franky.ti1.com/super.franky/error /var/www/super.franky.ti1.com
mv /var/www/super.franky.ti1.com/super.franky/public /var/www/super.franky.ti1.com
rm -rf /var/www/super.franky.ti1.com/super.franky

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

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/super.franky.ti1.com.conf

service apache2 restart