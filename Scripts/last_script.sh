# Butuh file ini
# Karena setelah run script di Skypie, sempat merubah config di Enieslobby
# Jadi, harus run file ini :)

if [[ $(hostname) = "Enieslobby" ]]; then
service bind9 restart
fi