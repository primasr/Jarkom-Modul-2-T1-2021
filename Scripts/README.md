# Ada apa sih di folder ini?

## File Utama
Ada dua file utama disini (sebenarnya satu sih), yaitu:
1. `script.sh`

File UTAMA yang berisikan banyak konfigurasi

2. `last_script.sh`

File PENUTUP yang berisikan perintah `service bind9 restart` yang dijalankan di Enieslobby

## File Optional
Ada beberapa folder yang namanya sesuai dengan nama node yang ada

Pada tiap folder berisikan kumpulan file script dengan format `xx.sh` atau `xx_testing.sh`. Dengan ketentuan:
- `xx` , menunjukkan nomor soal
- `xx.sh` , dijalankan untuk melakukan Setting
- `xx_testing.sh` , dijalankan untuk melakukan Testing (dilakukan di node Client)

Jadi, kita bisa melakukan run bash untuk melakukan pengecekan pada tiap soal