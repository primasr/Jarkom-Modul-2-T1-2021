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
---
## Soal 3
Setelah itu buat subdomain super.franky.yyy.com dengan alias ```www.super.franky.yyy.com``` yang diatur DNS nya di EniesLobby dan mengarah ke Skypie

## Jawaban
---
## Soal 4
Buat juga reverse domain untuk domain utama

## Jawaban
---
## Soal 5
Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama

## Jawaban
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