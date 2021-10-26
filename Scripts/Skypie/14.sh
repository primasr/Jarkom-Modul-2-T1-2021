cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/general.mecha.franky.ti1.com.conf

echo '
<VirtualHost *:15000>
        ServerAdmin webmaster@localhost

        ServerName general.mecha.franky.ti1.com
        DocumentRoot/var/www/general.mecha.franky.ti1.com
        <Directory />
            Options FollowSymLinks
            AllowOverride None
        </Directory>
        <Directory /var/www/general.mecha.franky.ti1.com>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Order allow,deny
            allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

<VirtualHost *:15500>
        ServerAdmin webmaster@localhost
        ServerName general.mecha.franky.ti1.com
        DocumentRoot/var/www/general.mecha.franky.ti1.com
        <Directory />
            Options FollowSymLinks
            AllowOverride None
        </Directory>
        <Directory /var/www/general.mecha.franky.ti1.com>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Order allow,deny
            allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/general.mecha.franky.ti1.com.conf

echo '
Listen 80
Listen 15000
Listen 15500

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>
' > /etc/apache2/ports.conf

a2ensite general.mecha.franky.ti1.com.conf

mkdir -p /var/www/general.mecha.franky.ti1.com

unzip /root/Praktikum-Modul-2-Jarkom/general.mecha.franky.zip -d /var/www/general.mecha.franky.ti1.com
mv /var/www/general.mecha.franky.ti1.com/general.mecha.franky/* /var/www/general.mecha.franky.ti1.com

rm -rf /var/www/general.mecha.franky.ti1.com/general.mecha.franky

service apache2 restart