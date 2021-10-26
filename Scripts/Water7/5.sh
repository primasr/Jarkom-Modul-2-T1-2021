echo '
zone "franky.ti1.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.ti1.com";
};
' > /etc/bind/named.conf.local

service bind9 restart