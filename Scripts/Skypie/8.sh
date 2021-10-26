cp -n /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/franky.ti1.com.conf

echo '
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.ti1.com
        ServerName franky.ti1.com
        ServerAlias www.franky.ti1.com

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/franky.ti1.com.conf

a2ensite franky.ti1.com

# service apache2 restart

mkdir -p /var/www/franky.ti1.com

cd ~

if [ ! -d "/root/Praktikum-Modul-2-Jarkom" ] ; then
    git clone https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom.git    
fi

unzip /root/Praktikum-Modul-2-Jarkom/franky.zip -d /var/www/franky.ti1.com
mv /var/www/franky.ti1.com/franky/* /var/www/franky.ti1.com
rm -rf /var/www/franky.ti1.com/franky

service apache2 restart