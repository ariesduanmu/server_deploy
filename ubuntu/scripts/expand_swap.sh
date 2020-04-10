# expanding the swap space to 4GB
sudo swapoff -a
sudo dd if=/dev/zero of=/etc/dphys-swapfile bs=1024 count=4M
# Make the file usable as swap
sudo mkswap /etc/dphys-swapfile
# Activate the swap file
sudo swapon /etc/dphys-swapfile
# get the swap space info
grep SwapTotal /proc/meminfo