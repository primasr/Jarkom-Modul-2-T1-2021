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