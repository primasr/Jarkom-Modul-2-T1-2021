# Jarkom-Modul-2-T1-2021

## Anggota Kelompok

- Prima Secondary Ramadhan  05311940000001
- Asiyah Hanifah            05311940000002
- Widya Inayatul            053119400000xx
---
## Soal 1
Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses ```franky.yyy.com``` dengan alias ```www.franky.yyy.com``` pada folder kaizoku.

## Jawaban
Sebelum mengerjakan soal ini, kami membuat topologinya sebagai berikut.
<<gambar1>>
Kemudian kami atur konfigurasi pada setiap node seperti gambar berikut.

a. Foosha sebagai router

b. Loguetown sebagai client

c. Alabasta sebagai client

d. Enieslobby sebagai DNS Master

e. Water7 sebagai DNS Slave

f. Skypie sebagai webserver

Setelah itu, setiap node diaktifkan dengan mengklik tombol start. Selanjutnya, menjalankan command ```iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.42.0.0/16``` pada router Foosha upaya dapat terkoneksi dengan internet.

Kemudian pada Ennieslobby, Water, dan Skypie dilakukan update package lists dengan menjalankan command:<br>
```apt-get update```

Selanjutnya kami menjalankan command untuk menginstall nano:<br>
```apt-get install nano```

Pada Ennieslobby dan Water dilakukan instalasi aplikasi bind9 juga dengan menjalankan command:<br>
```apt-get install bind9 -y```

Sedangkan pada Skypie dilakukan instalasi apache dengan menjalankan command:<br>
```apt-get install apache2 -y```