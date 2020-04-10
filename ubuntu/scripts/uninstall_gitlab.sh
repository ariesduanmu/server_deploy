sudo gitlab-ctl uninstall
sudo gitlab-ctl cleanse
sudo gitlab-ctl remove-accounts
sudo dpkg -P gitlab-ce

sudo rm -rf /opt/gitlab

sudo rm -rf /var/opt/gitlab
sudo rm -rf /etc/gitlab
sudo rm -rf /var/log/gitlab