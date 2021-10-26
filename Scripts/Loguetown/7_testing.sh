ping -c 3 general.mecha.franky.ti1.com

echo -e "\n"
host -t A general.mecha.franky.ti1.com
echo -e "\n"
host -t CNAME www.general.mecha.franky.ti1.com
echo -e "\n"

ping -c 3 www.general.mecha.franky.ti1.com