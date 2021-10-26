echo '
# nameserver 192.168.122.1
nameserver 10.42.2.2
nameserver 10.42.2.3
' > /etc/resolv.conf

ping -c 3 franky.ti1.com