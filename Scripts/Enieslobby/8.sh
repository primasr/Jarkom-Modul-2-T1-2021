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