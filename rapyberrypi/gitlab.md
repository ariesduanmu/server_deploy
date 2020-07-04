* sudo dpkg-reconfigure locales
* choose `en_GB.UTF-8 UTF-8`
* Default locale for the system environment `en_GB.UTF-8`

* sudo apt-get install curl openssh-server ca-certificates apt-transport-https
* curl https://packages.gitlab.com/gpg.key | sudo apt-key add -

* sudo apt-get install -y postfix

* sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | sudo bash

* sudo apt-get install gitlab-ce


configures(/`etc/gitlab/gitlab.rb`)

```
external_url = "http://your-domain-or-ip"
unicorn["worker_processes"] = 3
sidekiq['concurrency'] = 10 # I don't have this
prometheus_monitoring['enable'] = false
```

* sudo gitlab-ctl reconfigure

* sudo gitlab-ctl start

nginx config `/var/opt/gitlab/nginx/conf/gitlab-http.conf` where you can change your port external, default is 80