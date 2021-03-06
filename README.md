# Jarkom-Modul-2-T1-2021

## Anggota Kelompok

- Prima Secondary Ramadhan  05311940000001
- Asiyah Hanifah            05311940000002
- Widya Inayatul            05311940000010
---
## Soal 1
EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet

## Jawaban
Sebelum mengerjakan soal ini, kami membuat topologinya sebagai berikut.
![1.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.jpg?raw=true)

Kemudian kami atur konfigurasi pada setiap node seperti gambar berikut.

a. Foosha sebagai router
![1.1](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.1.jpg?raw=true)

b. Loguetown sebagai client
![1.2](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.2.jpg?raw=true)

c. Alabasta sebagai client
![1.3](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.3.jpg?raw=true)

d. Enieslobby sebagai DNS Master
![1.4](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.4.jpg?raw=true)

e. Water7 sebagai DNS Slave
![1.5](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.5.jpg?raw=true)

f. Skypie sebagai webserver
![1.6](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/1.6.jpg?raw=true)

Setelah itu, setiap node diaktifkan dengan mengklik tombol start. Selanjutnya, menjalankan command ```iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.42.0.0/16``` pada router Foosha upaya dapat terkoneksi dengan internet.

Kemudian pada Ennieslobby, Water, dan Skypie dilakukan update package lists dengan menjalankan command:<br>
```apt-get update```

Selanjutnya kami menjalankan command untuk menginstall nano:<br>
```apt-get install nano```

Pada Ennieslobby dan Water dilakukan instalasi aplikasi bind9 juga dengan menjalankan command:<br>
```apt-get install bind9 -y```

Sedangkan pada Skypie dilakukan instalasi apache dengan menjalankan command:<br>
```apt-get install apache2 -y```

---
## Soal 2
Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses ```franky.yyy.com``` dengan alias ```www.franky.yyy.com``` pada folder kaizoku

## Jawaban
a. Kami melakukan membuat domain **franky.ti1.com** di ```/etc/bind/named.conf.local``` dan mengisi konfigurasinya seperti berikut.
```
zone "franky.ti1.com" {
        type master;
        file "/etc/bind/kaizoku/franky.ti1.com";
};
```
Kemudian kami kami membuat folder kaizoku dengan
```mkdir -p /etc/bind/kaizoku```
Setelah itu kami mengopykan db.local pada path /etc/bind ke dalam folder kaizoku yang baru saja dibuat dan ubah namanya menjadi **frankyti1.com** dengan command:
```cp /etc/bind/db.local /etc/bind/kaizoku/franky.ti1.com```

Kami membuka file **frankyti1.com** dan edit seperti gambar berikut disesuaikan dengan IP Ennieslobby kami dengan command ```nano /etc/bind/kaizoku/franky.ti1.com```
```
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
```
Dan melakukan restart dengan ```service bind9 restart```

b. Kemudian pada Loguetown kami melakukan setting nameserver untuk mengarahkan client Loguetown ke Enniesloby seperti berikut di ```/etc/resolv.conf```
```nameserver 10.42.2.2```

Setelah itu melakukan testing dengan command:

```ping -c 3 franky.ti1.com```

![2.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/2.0.jpg?raw=true)

```host -t CNAME www.franky.ti1.com```

```ping -c 3 www.franky.ti1.com```

![2.1](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/2.1.jpg?raw=true)

---
## Soal 3
Setelah itu buat subdomain super.franky.yyy.com dengan alias ```www.super.franky.yyy.com``` yang diatur DNS nya di EniesLobby dan mengarah ke Skypie

## Jawaban
a. Pada Enieslobby kami mengubah konfigurasi di ```/etc/bind/kaizoku/franky.ti1.com``` seperti berikut untuk menambahkan subdomain dan memberi alias subdomain tersebut menjadi ```www.super.franky.yyy.com``` dan mengarahkannya ke IP Skypie (10.42.2.4) sebagai berikut.
```
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
www.super       IN      CNAME   super.franky.ti1.com
```
Setelah itu mulai merestartnya seperti biasa.

b. Sedangkan pada Loguetown kami melakukan testing untuk mengecek apakah subdomain dapat berjalan seperti berikut.
```ping -c 3 super.franky.ti1.com```

![3.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/3.0.jpg?raw=true)

```host -t A super.franky.ti1.com```

```ping -c 3 www.super.franky.ti1.com```

![3.1](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/3.1.jpg?raw=true)

---
## Soal 4
Buat juga reverse domain untuk domain utama

## Jawaban
a. Pada Enniesloby kami mengubah konfigurasinya untuk reverse domain utamanya dengan membalik IP Eniesloby di ```/etc/bind/named.conf.local``` seperti berikut.
```
zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.42.10.in-addr.arpa";
};
```
Kemudian kami melakukan copy file db.local pada path /etc/bind ke dalam folder kaizoku yang baru saja dibuat dan ubah namanya menjadi 2.40.10.in-addr.arpa dengan command: ```cp /etc/bind/db.local /etc/bind/kaizoku/2.42.10.in-addr.arpa```

Dan mengedit file ```/etc/bind/kaizoku/2.42.10.in-addr.arpa``` seperti berikut.
```
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
2.42.10.in-addr.arpa.   IN      NS      franky.ti1.com.
2                       IN      PTR     franky.ti1.com.
```
Setelah itu melakukan restart

b. Sedangkan pada Loguetown kami melakukan pengecekan dengan command: ```host -t PTR 10.42.2.2```

![4.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/4.0.jpg?raw=true)

---
## Soal 5
Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama

## Jawaban
a. Pada Enieslobby kami edit configurasinya di ```/etc/bind/named.conf.local``` seperti berikut.
```
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
```
Dan melakukan restart.

b. Untuk di Water7  kami mengatur konfiguasinya pada ```/etc/bind/named.conf.local``` untuk memberikan status DNS Slave pada Water7 seperti berikut.
```
zone "franky.ti1.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.ti1.com";
};
```
Dan melakukan restart.

c. Untuk testing, kami matikan terlebih dahulu Ennieslobbynya. Dengan command: ```service bind9 stop``` dan di Loguetown kamu mulai melakukan testing dengan command: ```ping -c 3 franky.ti1.com```

![5.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/5.0.jpg?raw=true)

---
## Soal 6
Setelah itu terdapat subdomain ```mecha.franky.yyy.com``` dengan alias ```www.mecha.franky.yyy.com``` yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo

## Jawaban
a. Pada Enieslobby, kami mengatur konfigurasi di ```/etc/bind/kaizoku/franky.ti1.com``` untuk membuat subdomain ```mecha.franky.yyy.com``` dan memberi alias menjadi ```www.mecha.franky.yyy.com``` seperti berikut.
```
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
```
Kemudian kami juga mengganti konfigurasi option di ``` /etc/bind/named.conf.options``` seperti berikut.
```
options {
        directory "/var/cache/bind";
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```
Dan mengedit konfigurasi di ```/etc/bind/named.conf.local``` seperti berikut.
```
zone "franky.ti1.com" {
    type master;
    file "/etc/bind/kaizoku/franky.ti1.com";
    allow-transfer { 10.42.2.3; };
};
zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.42.10.in-addr.arpa";
};
```
Dan melakukan restart.

b. Pada Water7 kami mengedit konfigurasi optionnya di ```/etc/bind/named.conf.options``` seperti berikut.
```
options {
        directory "/var/cache/bind";
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```
Kemudian mengedit konfigurasi lokalnya di ```/etc/bind/named.conf.local``` seperti berikut.
```
zone "mecha.franky.ti1.com" {
    type master;
    file "/etc/bind/sunnygo/mecha.franky.ti1.com";
};
```
Setelah itu membuat file sunnygo```mkdir -p /etc/bind/sunnygo```. Kemudian kami melakukan copy file db.local pada path /etc/bind ke dalam folder sunnygo yang baru saja dibuat dan ubah namanya menjadi mecha.franky.ti1.com dengan command: ```cp /etc/bind/db.local /etc/bind/sunnygo/mecha.franky.ti1.com```.

Kemudian mengedit konfigurasi di ```/etc/bind/sunnygo/mecha.franky.ti1.com``` dengan:
```
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
```
Kemudian melakukan restart.

c. Di Loguetown kami melakukan testing dengan:

```
ping -c 3 mecha.franky.ti1.com
```
![6.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/6.0.jpg?raw=true)
```
ping -c 3 www.mecha.franky.ti1.com
```
![2.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/6.1.jpg?raw=true)

---
## Soal 7
Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama ```general.mecha.franky.yyy.com``` dengan alias ```www.general.mecha.franky.yyy.com``` yang mengarah ke Skypie

## Jawaban
a. Pada Water 7, kami mengedit konfigurasi di ```/etc/bind/sunnygo/mecha.franky.ti1.com``` untuk membuat subdomain dengan nama ```general.mecha.franky.ti1.com``` dan diberi alias ```www.general.mecha.franky.ti1.com``untuk diarakhkan ke IP Skypie (10.42.2.4) seperti berikut.
```
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
```
Kemudian dilakukan restart.

b. Dan di Loguetown kami melakukan testing dengan command:
```
ping -c 3 general.mecha.franky.ti1.com
```
![7.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/7.0.jpg?raw=true)
```
host -t A general.mecha.franky.ti1.com
```
![7.1](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/7.1.jpg?raw=true)
```
host -t CNAME www.general.mecha.franky.ti1.com

ping -c 3 www.general.mecha.franky.ti1.com
```
![7.2](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/7.2.jpg?raw=true)

---
## Soal 8
Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver ```www.franky.yyy.com.``` Pertama, luffy membutuhkan webserver dengan DocumentRoot pada ```/var/www/franky.yyy.com.```

## Jawaban
a. Pada Skypie, kami buat konfigurasi servernya terlebih dulu. Dengan Copy file 000-default.conf menjadi file /etc/apache2/sites-available/franky.ti1.com.conf dengan perintah: ```cp -n /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/franky.ti1.com.conf``` Kemudian mengatur konfigurasi pada ```/etc/apache2/sites-available/franky.ti1.com.conf``` untuk menambahkan nama server, server aliasnya, dan DocumentRoot sesuai soal seperti berikut.
```
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.ti1.com
        ServerName franky.ti1.com
        ServerAlias www.franky.ti1.com
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
Kemudian kami mengaktifkan konfigurasi franky.ti1.com dengan command: ```a2ensite franky.ti1.com```

Kami buat folder dengan nama franky.ti1.com menggunakan command: ```mkdir -p /var/www/franky.ti1.com``` kemudian kami kembali ke folder sebelumnya dengan ```cd ~``` dan melakukan git clone github terlebih dahulu untuk mendapatkan file yang disediakan oleh soal dengan command:
```
if [ ! -d "/root/Praktikum-Modul-2-Jarkom" ] ; then
    git clone https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom.git    
fi
```
![8.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/8.0.jpg?raw=true)

Setelah itu kami lakukan unzip karena bentuk file yang diterima dalam bentuk zip file. dengan command:
```
unzip /root/Praktikum-Modul-2-Jarkom/franky.zip -d /var/www/franky.ti1.com
```
Kemudian kami memindahkan file yang telah diunzip ke /var/www/franky.ti1.comdengan command:

```mv /var/www/franky.ti1.com/franky/* /var/www/franky.ti1.com```

Setelah itu kami menghapus file yang telah diunzip dalam ```/var/www/franky.ti1.com/franky/``` dengan command:

```rm -rf /var/www/franky.ti1.com/franky```

Kemudian kami lakukan apache restartdengan command:

```service apache2 restart```

b. Pada Enieslobby, kami mengedit file ```/etc/bind/kaizoku/franky.ti1.com``` seperti berikut.
```
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
```

Kemudian kamu lakukan bind9 restart.

c. Untuk testing pada Loguetown, kami gunakan command: ```lynx http://franky.ti1.com/index.php``` untuk mengecek konfigurasi server yang dibuat

![8.1](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/8.1.jpg?raw=true)
---
## Soal 9
Setelah itu, Luffy juga membutuhkan agar url ```www.franky.yyy.com/index.php/home``` dapat menjadi menjadi ```www.franky.yyy.com/home```

## Jawaban
a. Pada Skypie kami mengaktifkan module rewrite dengan command:
```a2enmod rewrite```. Setelah itu kami lakukan restart apache. Kemudian kami edit ```/var/www/franky.ti1.com/.htaccess``` dari Skypie seperti berikut. Hal ini dilakukan untuk mengatasi masalah hak akses root untuk mengedit file konfigurasi yang berada di folder /etc/apache2/sites-available tidak dimiliki, atau kita tidak ingin user lain untuk mengedit file konfigurasi yang berada di directory /etc/apache2/sites-available.
```
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ $1.php [NC,L]
```
Kemudian kami edit ```/etc/apache2/sites-available/franky.ti1.com.conf``` untuk menambahkan follows symlink dan AllowOveride All supaya mod_rewrite dan .htaccessnya berjalan seperti berikut.
```
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.ti1.com
        ServerName franky.ti1.com
        ServerAlias www.franky.ti1.com
         <Directory /var/www/franky.ti1.com>
             Options +FollowSymLinks -Multiviews
             AllowOverride All
         </Directory>
        Alias "/index.php" "/var/www/franky.ti1.com/index.php"
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
Kemudian kami lakukan apache restart.
b. Pada Loguetown kami melakukan testing dengan command: ```lynx http://franky.ti1.com```
![9.0](https://github.com/primasr/Jarkom-Modul-2-T1-2021/blob/main/images/9.0.jpg?raw=true)

---
## Soal 10
Setelah itu, pada subdomain ```www.super.franky.yyy.com``` , Luffy membutuhkan penyimpanan aset yang memiliki DocumentRoot pada ```/var/www/super.franky.yyy.com```

## Jawaban
a. Pada node skypie melakukan konfigurasi virtual host dengan perintah ```/etc/apache2/sites-available/``` dan melakukan copy file ```franky.ti1.com.conf super.franky.ti1.com.conf``` kami edit konfigurasinya pada ```super.franky.ti1.com.conf``` seperti berikut. 
```
<VirtualHost *:80>

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/super.franky.ti1.com
    	ServerName super.franky.ti1.com
    	ServerAlias www.super.franky.ti1.com

     	<Directory /var/www/super.franky.ti1.com>
         	Options +FollowSymLinks -Multiviews
         	AllowOverride All
     	</Directory>

    	Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

```
Untuk mengaktifkan suatu konfigurasi, kita menggunakan perintah a2ensite diikuti dengan nama file konfigurasi yang telah dibuat. Perintah yang dijalankan ```a2ensite super.franky.ti1.com```. lalu pindahkan directory dengan perintah ```cd /var/www```. melakukan copyfile ```cp -R franky.ti1.com super.franky.ti1.com```.

Untuk mengaktifkan konfigurasi menggunakan perintah ```a2ensite super.franky.ti1.com``` dan dilakukan restart apache menggunakan perintah ```service apache2 restart```.

b. Melakukan testing pada Loguetown dengan perintah ```lynx http://super.franky.ti1.com/home```. seprti berikut ini

![10](https://user-images.githubusercontent.com/73151978/139522209-1a87f5ed-c0a3-4356-ae2f-a53ac1b63a5e.png)

## Soal 11
Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja (pada ```super.franky.ti1.com```)

## Jawaban
a. Pada skypie dilakukan unzip pada github modul 2 jarkom di directory super.franky.ti1.com seperti pada perintah ```unzip /root/Praktikum-Modul-2-Jarkom/super.franky.zip -d /var/www/super.franky.ti1.com ```. 

memindahkan pada folder /public untuk melakukan directory listing dengan printah 
```mv /var/www/super.franky.ti1.com/super.franky/error /var/www/super.franky.ti1.com```
```mv /var/www/super.franky.ti1.com/super.franky/public /var/www/super.franky.ti1.com```

Dan memindahkan directory dengan perintah ```/etc/apache2/sites-available``` lalu melakukan edit konfigurasi di ``` /etc/apache2/sites-available/super.franky.ti1.com.conf``` seperti berikut ini. 
```
<VirtualHost *:80>

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/super.franky.ti1.com
    	ServerName super.franky.ti1.com
    	ServerAlias www.super.franky.ti1.com

     	<Directory /var/www/super.franky.ti1.com>
         	Options +FollowSymLinks -Multiviews
         	AllowOverride All
     	</Directory>

     	<Directory /var/www/super.franky.ti1.com/public>
         	Options +Indexes
     	</Directory>

    	Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

```
Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```.

b. Dilakukan testing pada Loguetown dengan perintah ```lynx http://super.franky.ti1.com/public```. untuk mengecek apakah sudah melakukan directory listing pada folder/public.

![11](https://user-images.githubusercontent.com/73151978/139522200-c2e6fecc-b74f-4abf-be38-0af123e83367.png)

## Soal 12
Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache

## Jawaban
a. Pada Skypie dilakukan edit kofigurasi pada ```/etc/apache2/sites-available/super.franky.ti1.com.conf``` seperti ini. Ditambahkan tag pada directory untuk /public ditambahkan options + indexes.

```
<VirtualHost *:80>

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/super.franky.ti1.com
    	ServerName super.franky.ti1.com
    	ServerAlias www.super.franky.ti1.com

     	<Directory /var/www/super.franky.ti1.com>
         	Options +FollowSymLinks -Multiviews
         	AllowOverride All
     	</Directory>

     	<Directory /var/www/super.franky.ti1.com/public>
         	Options +Indexes
     	</Directory>

    	Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

    	ErrorDocument 404 /error/404.html
    	ErrorDocument 500 /error/404.html
    	ErrorDocument 502 /error/404.html
    	ErrorDocument 503 /error/404.html
    	ErrorDocument 504 /error/404.html

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```
 Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```

b. Dilakukan testing pada Loguetown dengan perintah ```lynx http://super.franky.ti1.com/sesuatu.php```

![12](https://user-images.githubusercontent.com/73151978/139522206-c39699a4-4256-4afe-8ac8-4d36e00baab2.png)
        
## Soal 13
 Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset ```www.super.franky.yyy.com/public/js``` menjadi ```www.super.franky.yyy.com/js```

## Jawaban
a. Pada Skypie dilakukan edit kofigurasi pada ```/etc/apache2/sites-available/super.franky.ti1.com.conf``` dan ditambahkan ```Alias "/js" "/var/www/super.franky.ti1.com/public/js"``` seperti ini.
```
<VirtualHost *:80>

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/super.franky.ti1.com
    	ServerName super.franky.ti1.com
    	ServerAlias www.super.franky.ti1.com

     	<Directory /var/www/super.franky.ti1.com>
         	Options +FollowSymLinks -Multiviews
         	AllowOverride All
     	</Directory>

     	<Directory /var/www/super.franky.ti1.com/public>
         	Options +Indexes
     	</Directory>

    	Alias "/index.php" "/var/www/super.franky.ti1.com/index.php"

    	ErrorDocument 404 /error/404.html
    	ErrorDocument 500 /error/404.html
    	ErrorDocument 502 /error/404.html
    	ErrorDocument 503 /error/404.html
    	ErrorDocument 504 /error/404.html

<Directory /var/www/super.franky.ti1.com/public/js>
     Options +Indexes
</Directory>
 
Alias "/js" "/var/www/super.franky.ti1.com/public/js"

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

```
b. Dilakukan testing pada loguetown dengan perintah ```lynx http://super.franky.ti1.com/js```

![13](https://user-images.githubusercontent.com/73151978/139522238-de1dc9b8-65d9-4d13-b3fe-f384d5617191.png)

## Soal 14
Dan Luffy meminta untuk web ```www.general.mecha.franky.yyy.com ``` hanya bisa diakses dengan port 15000 dan port 15500

## Jawaban
a. Pada skypie dilakukan pindah ke directory /etc/apache2/sites-available menggunakan perintah ```cd /etc/apache2/sites-available``` lalu Copy file 000-default.conf ```cp /etc/apache2/sites-available/000-default.conf``` menjadi ```/etc/apache2/sites-available/general.mecha.franky.ti1.com.conf```. Dan dilakukan edit konfigurasi pada ```/etc/apache2/sites-available/general.mecha.franky.ti1.com.conf```. seperti berikut 
```
<VirtualHost *:15000>
    	ServerAdmin webmaster@localhost

    	ServerName general.mecha.franky.ti1.com
    	DocumentRoot /var/www/general.mecha.franky.ti1.com
    	<Directory />
            	Options FollowSymLinks
            	AllowOverride None
    	</Directory>
    	<Directory /var/www/general.mecha.franky.ti1.com>
            	Options Indexes FollowSymLinks MultiViews
            	AllowOverride All
            	Order allow,deny
            	allow from all
    	</Directory>

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

<VirtualHost *:15500>
    	ServerAdmin webmaster@localhost
    	ServerName general.mecha.franky.ti1.com
    	DocumentRoot /var/www/general.mecha.franky.ti1.com
    	<Directory />
            	Options FollowSymLinks
            	AllowOverride None
    	</Directory>
    	<Directory /var/www/general.mecha.franky.ti1.com>
            	Options Indexes FollowSymLinks MultiViews
            	AllowOverride All
            	Order allow,deny
            	allow from all
    	</Directory>

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

```
Dan pada file ```/etc/apache2/ports.conf``` ditambahkan line listen 15000 dan listen 15500.

Lalu mengaktifkan konfigurasi dengan perintah ```a2ensite general.mecha.franky.ti1.com```. Dan pada /var/www dibuat folder dengan perintah ```mkdir -p /var/www/general.mecha.franky.ti1.com```. 

dilakukan unzip pada github modul 2 jarkom di directory super.franky.ti1.com seperti pada perintah ```unzip /root/Praktikum-Modul-2-Jarkom/general.mecha.franky.zip -d /var/www/general.mecha.franky.ti1.com```.

Pemindahan ke folder menggunakan perintah seperti berikut
```mv /var/www/general.mecha.franky.ti1.com/general.mecha.franky/* /var/www/general.mecha.franky.ti1.com```

Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```

b. Testing pada loguetown menggunakan perintah 
```
lynx http://general.mecha.franky.ti1.com:15000
lynx http://general.mecha.franky.ti1.com:15500
```
![14](https://user-images.githubusercontent.com/73151978/139522240-fdae073e-4693-4feb-a41f-d537e601a97f.png)

## Soal 15
dengan autentikasi username luffy dan password onepiece dan file di ```/var/www/general.mecha.franky.yyy```

## Jawaban
a. Pada skypie menjalankan perintah ```htpasswd -c -b /etc/apache2/.htpasswd luffy onepiece ``` membuat
file yang menyimpan username dan password kedalam file /etc/apache2/.htpasswd
dengan user luffy dan password onepiece, lalu akan ada prompt untuk memasukkan passwordnya. 

Pada file ```/etc/apache2/sites-available``` dan edit pada ```general.mecha.franky.ti1.com.conf``` dengan menambahkan AllowOverride All.

Lalu edit pada ``` /var/www/general.mecha.franky.ti1.com/.htaccess``` dengan berikut ini
```
AuthType Basic
AuthName "Restricted Content."
AuthUserFile /etc/apache2/.htpasswd
Require valid-user
```
Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```

b. Pada Loguetown dilakukan testing dengan perintah 
```
lynx http://general.mecha.franky.ti1.com:15000
lynx http://general.mecha.franky.ti1.com:15500
```

![15a](https://user-images.githubusercontent.com/73151978/139522241-732dff15-c419-4afa-ae3e-ed9cb14d343f.png)

![15b](https://user-images.githubusercontent.com/73151978/139522242-d66785ab-f361-47f8-922a-d125cfcbdc96.png)

![15c](https://user-images.githubusercontent.com/73151978/139522245-4ce4b254-95e9-409a-9996-06bfc541d2b9.png)

## Soal 16
Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke ```www.franky.yyy.com```

## Jawaban
a. Pada Skypie dilakukan edit pada file ``` /etc/apache2/sites-available/000-default.conf``` dengan menambahkan line ```Redirect 301 / http://www.franky.ti1.com```

Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```

b. Pada Loguetown dilakukan testing dengan perintah ```lynx http://10.42.2.4``` yang mengakses IP skypie 

![16a](https://user-images.githubusercontent.com/73151978/139522246-63a02ae3-a61c-44e7-b224-abd76887c5f9.png)

![16b](https://user-images.githubusercontent.com/73151978/139522247-1b68e4cd-0bbf-4322-a15b-f576389f706d.png)

## Soal 17
Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website ```www.super.franky.yyy.com``` , dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring **???franky???** akan diarahkan menuju **franky.png**. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!
## Jawaban
a. Pada Skypie dilakukan edit di ``` /var/www/super.franky.ti1.com/.htaccess``` seperti berikut ini 
```
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^\.]+)$ $1.php [NC,L]
RewriteRule ^(.*)franky(.*)$ public/images/franky.png
```
Dan dilakukan restart apache menggunakan perintah ```service apache2 restart```

b. Pada Loguetown dilakukan testing dengan perintah ```lynx http://www.super.franky.ti1.com/public/images/franky.png```

![17](https://user-images.githubusercontent.com/73151978/139522235-5e501dc9-6c4d-4b1b-9153-16204785bec8.png)
## Kendala
