if [[ $(hostname) = "Enieslobby" ]]; then
# echo 'Hai, aku di Enieslobby'

#
## NOMOR 2
#
echo '
zone "franky.ti1.com" {
        type master;
        file "/etc/bind/kaizoku/franky.ti1.com";
};
' > /etc/bind/named.conf.local

mkdir -p /etc/bind/kaizoku
cp /etc/bind/db.local /etc/bind/kaizoku/franky.ti1.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.ti1.com. root.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      franky.ti1.com.
@       IN      A       10.42.2.2
www     IN      CNAME   franky.ti1.com.
' > /etc/bind/kaizoku/franky.ti1.com

service bind9 restart

#
## NOMOR 3
#     
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.ti1.com. root.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      franky.ti1.com.
@       IN      A       10.42.2.2
www     IN      CNAME   franky.ti1.com.

super           IN      A       10.42.2.4       ; IP Skypie
www.super       IN      CNAME   super.franky.ti1.com.
' > /etc/bind/kaizoku/franky.ti1.com

service bind9 restart

#
## NOMOR 4
#
echo '
zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.42.10.in-addr.arpa";
};
' >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/kaizoku/2.42.10.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.ti1.com. root.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
2.42.10.in-addr.arpa.   IN      NS      franky.ti1.com.
2                       IN      PTR     franky.ti1.com.
' > /etc/bind/kaizoku/2.42.10.in-addr.arpa

service bind9 restart  

#
## NOMOR 5
#
echo '
zone "franky.ti1.com" {
    type master;
    notify yes;
    also-notify { 10.42.2.3; };
    allow-transfer { 10.42.2.3; };
    file "/etc/bind/kaizoku/franky.ti1.com";
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.42.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

service bind9 restart    

#
## NOMOR 6
#
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.ti1.com. root.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      franky.ti1.com.
@       IN      A       10.42.2.2
www     IN      CNAME   franky.ti1.com.

super           IN      A       10.42.2.4       ; IP Skypie
www.super       IN      CNAME   franky.ti1.com.

ns1             IN      A       10.42.2.3       ; IP Water7
mecha           IN      NS      ns1
www.mecha       IN      CNAME   franky.ti1.com.
' > /etc/bind/kaizoku/franky.ti1.com

echo '
options {
        directory "/var/cache/bind";

        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

echo '
zone "franky.ti1.com" {
    type master;
    file "/etc/bind/kaizoku/franky.ti1.com";
    allow-transfer { 10.42.2.3; };
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.42.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

service bind9 restart    

#
## NOMOR 8
#                
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.ti1.com. root.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      franky.ti1.com.
@       IN      A       10.42.2.4       ; IP Skypie
www     IN      CNAME   franky.ti1.com.

super           IN      A       10.42.2.4       ; IP Skypie
www.super       IN      CNAME   super.franky.ti1.com.

ns1             IN      A       10.42.2.3       ; IP Water7
mecha           IN      NS      ns1
www.mecha       IN      CNAME   franky.ti1.com.
' > /etc/bind/kaizoku/franky.ti1.com    

service bind9 start

fi

if [[ $(hostname) = "Water7" ]]; then
# echo 'Hai, aku di Water7'

#
## NOMOR 5
#  
echo '
zone "franky.ti1.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.ti1.com";
};
' > /etc/bind/named.conf.local

service bind9 restart

#
## NOMOR 6
#  
echo '
options {
        directory "/var/cache/bind";

        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

echo '
zone "mecha.franky.ti1.com" {
    type master;
    file "/etc/bind/sunnygo/mecha.franky.ti1.com";
};
' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sunnygo
cp /etc/bind/db.local /etc/bind/sunnygo/mecha.franky.ti1.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     mecha.franky.ti1.com. root.mecha.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      mecha.franky.ti1.com.
@       IN      A       10.42.2.4       ; IP Skypie
www     IN      CNAME   mecha.franky.ti1.com.
' > /etc/bind/sunnygo/mecha.franky.ti1.com

service bind9 restart

#
## NOMOR 7
#
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     mecha.franky.ti1.com. root.mecha.franky.ti1.com. (
                        2021100401      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      mecha.franky.ti1.com.
@       IN      A       10.42.2.4       ; IP Skypie
www     IN      CNAME   mecha.franky.ti1.com.

general       IN      A       10.42.2.4       ; IP Skypie
www.general   IN      CNAME   general.mecha.franky.ti1.com.
' > /etc/bind/sunnygo/mecha.franky.ti1.com

service bind9 restart   

fi

if [[ $(hostname) = "Skypie" ]]; then
# echo 'Hai, aku di Skypie'

#
## NOMOR 8
#
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

#
## NOMOR 9
#
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

#
## NOMOR 10
#
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

#
## NOMOR 11
#
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

#
## NOMOR 12
#
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

#
## NOMOR 13
#
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

        <Directory /var/www/super.franky.ti1.com/public/js>
            Options +Indexes
        </Directory>
        
        Alias "/js" "/var/www/super.franky.ti1.com/public/js"

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/super.franky.ti1.com.conf

service apache2 restart    

#
## NOMOR 14
#
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/general.mecha.franky.ti1.com.conf

echo '
<VirtualHost *:15000>
        ServerAdmin webmaster@localhost

        ServerName general.mecha.franky.ti1.com
        DocumentRoot /var/www/general.mecha.franky.ti1.com
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
        DocumentRoot /var/www/general.mecha.franky.ti1.com
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

#
## NOMOR 15
#
htpasswd -c -b /etc/apache2/.htpasswd luffy onepiece

echo '
AuthType Basic
AuthName "Restricted Content."
AuthUserFile /etc/apache2/.htpasswd
Require valid-user
' > /var/www/general.mecha.franky.ti1.com/.htaccess

service apache2 restart    

#
## NOMOR 16
#
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

#
## NOMOR 17
#             
echo '
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ $1.php [NC,L]
RewriteRule ^(.*)franky(.*)$ public/images/franky.png
' > /var/www/super.franky.ti1.com/.htaccess

service apache2 restart                               

fi

if [[ $(hostname) = "Loguetown" ]]; then
# echo 'Hai, aku di Loguetown'
# echo 'Jalankan bash sesuai nomor soal jika ingin mengecek :)'

echo '
# nameserver 192.168.122.1
nameserver 10.42.2.2
nameserver 10.42.2.3
nameserver 10.42.2.4
' > /etc/resolv.conf
fi

if [[ $(hostname) = "Alabasta" ]]; then
# echo 'Hai, aku di Alabasta'
# echo 'Jalankan bash sesuai nomor soal jika ingin mengecek :)'

echo '
# nameserver 192.168.122.1
nameserver 10.42.2.2
nameserver 10.42.2.3
nameserver 10.42.2.4
' > /etc/resolv.conf
fi