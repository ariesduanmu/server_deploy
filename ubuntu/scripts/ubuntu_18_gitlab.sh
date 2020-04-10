# expanding the swap space to 4GB
sudo swapoff -a
sudo dd if=/dev/zero of=/etc/dphys-swapfile bs=1024 count=4M
# Make the file usable as swap
sudo mkswap /etc/dphys-swapfile
# Activate the swap file
sudo swapon /etc/dphys-swapfile
# get the swap space info
grep SwapTotal /proc/meminfo

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix

# I blocked in "ruby_block[wait for redis service socket] action run" during installation
# then checked `ps aux | grep runsv`, no such process
# by start it manu `sudo /opt/gitlab/embedded/bin/runsvdir-start` it works 

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash


sudo apt-get install gitlab-ce


# gitlab-ctl tail


# default running port is 8080, well mine 8080 is used before, need to set
# unicorn['worker_processes'] to other port
sudo gitlab-ctl reconfigure

sudo gitlab-ctl start
# sudo gitlab-ctl stop

