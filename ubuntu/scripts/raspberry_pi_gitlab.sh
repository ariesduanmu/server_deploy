# I was being stupid, this should run in raspberry pi system not in ubuntu
# AND gitlab is too much for raspberry pi 3b+!!! CPU always around 95%

# 1. Configure Swap

# expanding the swap space to 4GB
sudo swapoff -a
sudo dd if=/dev/zero of=/etc/dphys-swapfile bs=1024 count=4M
# Make the file usable as swap
sudo mkswap /etc/dphys-swapfile
# Activate the swap file
sudo swapon /etc/dphys-swapfile
# get the swap space info
grep SwapTotal /proc/meminfo

# 2. Install and configure the necessary dependencies
sudo apt-get install curl openssh-server ca-certificates apt-transport-https
curl https://packages.gitlab.com/gpg.key sudo apt-key add -
sudo apt-get install -y postfix

# 3. Add the GitLab package repository and install the package
sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh sudo bash
sudo apt-get update

sudo apt-get install gitlab-ce
# configuration in /etc/gitlab/gitlab.rb file.
# Reduce running processes

# Reduce the number of running workers to the minimum in order to reduce memory usage
# For most instances we recommend using: CPU cores + 1 = unicorn workers. So for a machine with 2 cores, 3 unicorn workers is ideal.
# unicorn['worker_processes'] = 2

# sidekiq['concurrency'] = 9

# Turn off monitoring to reduce idle cpu and disk usage
# prometheus_monitoring['enable'] = false

# BUT GITLAB RETURN ME A 502 NEXT DAY, I changed the unicorn, not helpping

sudo gitlab-ctl reconfigure

sudo gitlab-ctl start
sudo gitlab-ctl stop

