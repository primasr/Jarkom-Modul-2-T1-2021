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