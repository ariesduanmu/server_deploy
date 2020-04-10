# get your wireless interface
iwconfig
# mine is wlan0
ifconfig wlan0 up
# scan nearby networks, EDDIS is the network name
sudo iwlist wlan0 scan | grep ESSID
# install wpa_supplicant
apt install wpasupplicant

# mine wpa_supplicant config file is in /etc/wpa_supplicant/wpa_supplicant.conf
wpa_supplicant MYESSID MYPASSPHRASE | sudo tee /etc/wpa_supplicant/wpa_supplicant.conf
sudo wpa_supplicant -B -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan0
sudo dhclient wlan0
ifconfig