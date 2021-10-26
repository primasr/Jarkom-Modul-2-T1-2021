htpasswd -c -b /etc/apache2/.htpasswd luffy onepiece

echo '
AuthType Basic
AuthName "Restricted Content."
AuthUserFile /etc/apache2/.htpasswd
Require valid-user
' > /var/www/general.mecha.franky.ti1.com/.htaccess

service apache2 restart