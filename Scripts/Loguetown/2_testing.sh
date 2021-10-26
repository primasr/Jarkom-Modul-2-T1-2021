echo '
# nameserver 192.168.122.1
nameserver 10.42.2.2
' > /etc/resolv.conf

ping -c 3 franky.ti1.com
host -t CNAME www.franky.ti1.com
ping -c 3 www.franky.ti1.com