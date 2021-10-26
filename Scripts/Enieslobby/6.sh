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