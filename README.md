# Jarkom-Modul-2-T1-2021

## Anggota Kelompok

- Prima Secondary Ramadhan  05311940000001
- Asiyah Hanifah            05311940000002
- Widya Inayatul            053119400000xx
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

b. Kemudian pada Loguetown kami melakukan setting nameserver untuk mengarahkan client Loguetown ke Enniesloby seperti berikut di ```etc/resolv.conf```
```nameserver 10.42.2.2```

Setelah itu melakukan testing dengan command:

```ping -c 3 franky.ti1.com```

(gambar 2.0)

```host -t CNAME www.franky.ti1.com```

```ping -c 3 www.franky.ti1.com```

(gambar2.1)

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

(gambar 3.0)

```host -t A super.franky.ti1.com```

```ping -c 3 www.super.franky.ti1.com```

(gambar 3.1)

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
Kemudian kami melakukan file db.local pada path /etc/bind ke dalam folder kaizoku yang baru saja dibuat dan ubah namanya menjadi 2.40.10.in-addr.arpa dengan command: ```cp /etc/bind/db.local /etc/bind/kaizoku/2.42.10.in-addr.arpa```

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

(gambar 4.0)

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

b. Untuk di Water7  kami mengatur konfiguasinya pada ```/etc/bind/named.conf.local``` seperti berikut.
```
zone "franky.ti1.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.ti1.com";
};
```
Dan melakukan restart.

c. Untuk testing, kami matikan terlebih dahulu Ennieslobbynya. Dengan command: ```service bind9 stop``` dan di Loguetown kamu mulai melakukan testing dengan command: ```ping -c 3 franky.ti1.com```

(gambar 5.0)

---
## Soal 6
Setelah itu terdapat subdomain ```mecha.franky.yyy.com``` dengan alias ```www.mecha.franky.yyy.com``` yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo

## Jawaban
---
## Soal 7
Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama ```general.mecha.franky.yyy.com``` dengan alias ```www.general.mecha.franky.yyy.com``` yang mengarah ke Skypie

## Jawaban
---
## Soal 8
Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver ```www.franky.yyy.com.``` Pertama, luffy membutuhkan webserver dengan DocumentRoot pada ```/var/www/franky.yyy.com.```

## Jawaban
---
## Soal 9
Setelah itu, Luffy juga membutuhkan agar url ```www.franky.yyy.com/index.php/home``` dapat menjadi menjadi ```www.franky.yyy.com/home```

## Jawaban
---
## Soal 10
Setelah itu, pada subdomain ```www.super.franky.yyy.com``` , Luffy membutuhkan penyimpanan aset yang memiliki DocumentRoot pada ```/var/www/super.franky.yyy.com```

## Jawaban
---
## Soal 11
Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja (pada ```super.franky.ti1.com```)

## Jawaban
---
## Soal 12
Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache

## Jawaban
---
## Soal 13
 Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset ```www.super.franky.yyy.com/public/js``` menjadi ```www.super.franky.yyy.com/js```

## Jawaban
---
## Soal 14
Dan Luffy meminta untuk web ```www.general.mecha.franky.yyy.com ``` hanya bisa diakses dengan port 15000 dan port 15500

## Jawaban
---
## Soal 15
dengan autentikasi username luffy dan password onepiece dan file di ```/var/www/general.mecha.franky.yyy```

## Jawaban
---
## Soal 16
Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke ```www.franky.yyy.com```

## Jawaban
---
## Soal 17
Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website ```www.super.franky.yyy.com``` , dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring **“franky”** akan diarahkan menuju **franky.png**. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!
## Jawaban
---
## Kendala