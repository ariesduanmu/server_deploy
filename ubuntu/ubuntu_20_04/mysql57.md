* `sudo add-apt-repository ppa:rafaeldtinoco/lp1871129`
* `sudo apt update`
* `sudo apt install libc6=2.31-0ubuntu8+lp1871129~1 libc6-dev=2.31-0ubuntu8+lp1871129~1 libc-dev-bin=2.31-0ubuntu8+lp1871129~1 -y --allow-downgrades`
* `sudo apt-mark hold libc6`

* `sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb`

* `sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb`
  - Select Ubuntu Bionic option and click on Ok.
  - Select MySQL 5.7 server and click on OK.

* `sudo apt-get update`
* `sudo apt-cache policy mysql-server`

```
mysql-server:
  Installed: 5.7.31-1ubuntu18.04
  Candidate: 8.0.20-0ubuntu0.20.04.1
  Version table:
     8.0.20-0ubuntu0.20.04.1 500
        500 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages
     8.0.19-0ubuntu5 500
        500 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages
     5.7.31-1ubuntu18.04 500
        500 http://repo.mysql.com/apt/ubuntu bionic/mysql-5.7 amd64 Packages
        100 /var/lib/dpkg/status
```

* `sudo apt install -f mysql-client=5.7.31-1ubuntu18.04`
* `sudo apt install -f mysql-community-server=5.7.31-1ubuntu18.04`
* `sudo apt install -f mysql-server=5.7.31-1ubuntu18.04`