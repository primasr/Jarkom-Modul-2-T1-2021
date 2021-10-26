echo '
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ $1.php [NC,L]
RewriteRule ^(.*)franky(.*)$ public/images/franky.png
' > /var/www/super.franky.ti1.com/.htaccess

service apache2 restart