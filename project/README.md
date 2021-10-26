# How to Use

## Import project

Tahu laaah.. caranya gimana

## Jalankan Script

Ada file bash script yang harus dijalankan pada tiap node dengan rincian sebagai berikut:

Pertama, pergi ke root dengan command
```sh
cd ~
```

Lalu, coba ketikkan command 
```sh
ls
``` 
untuk mengecek ada file apa saja. Seharusnya, ada sebuah file bernama `script.sh` (terkecuali di `Enieslobby` terdapat file tambahan yaitu `last_script.sh` ) DAN file tambahan lainnya

Lalu, jalankan file `script.sh` tadi pada setiap node dengan urutan:
1. Enieslobby

```sh
bash script.sh
```

2. Water7

```sh
bash script.sh
```

3. Loguetown

```sh
bash script.sh
```

4. Alabasta

```sh
bash script.sh
```

5. Skypie

```sh
bash script.sh
```

6. Enieslobby

```sh
bash last_script.sh
```

Kenapa kok ada dua file script di Enieslobby ?

Karena setelah kita run `bash script.sh` pada Skypie, disana kita melakukan perubahan konfigurasi yang mengharuskan kita melakukan restart bind9 di Enieslobby. Jadi, diperlukan run satu file script lagi untuk melakukan restart bind di Enieslobby :D

## Mengecek, Apakah Sudah Betul ?

Terdapat BUANYAK file script dengan format `xx_testing.sh` pada node Loguetown (Loguetown disini sbeagai client) (tidak saya letakkan di Alabasta)

Jika ingin mengecek, tinggal jalankan file script berdasarkan nomor soal yang ingin di cek

Semisal, ingin mengecek soal nomor 2. Jalankan seperti berikut:

```sh
bash 2_testing.sh
```


