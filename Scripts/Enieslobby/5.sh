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