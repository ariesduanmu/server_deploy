Ubuntu 18.10

## Create new user on server

* adduser aries

## Disable SSH Root Login

* vi /etc/ssh/sshd_config
```
...
PermitRootLogin no
...
```
* systemctl restart sshd
* service sshd restart
* /etc/init.d/ssh restart

## Add user to sudo group

*Ubuntu*
* adduser <username> sudo

*Centos*
* usermod -aG wheel <username>

## mirror

```

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
```

## install nginx

* apt install nginx

---
# MySQL

## install mysql

* apt install mysql-client-core-5.7 -y
* apt install mysql-client-5.7
* apt install mysql-server

### Run the security script

* mysql_secure_installation

### Test mysql

* systemctl status mysql.service

*if mysql is nto running `systemctl start mysql`*

### Add user

* mysql> use mysql;
* mysql> create user 'aries'@'localhost' identified by 'password';
* mysql> create database aries;
* mysql> grant all privileges on aries.* to "aries"@"localhost";
* mysql> FLUSH PRIVILEGES;


### update password

* mysql> update user set authentication_string=PASSWORD("password") where User="aries";
* mysql> FLUSH PRIVILEGES;

### Invalid default value for 'date_available'

`/etc/mysql/mysql.conf.d/mysqld.cnf`

```
[mysqld]
sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

```

ATTENTION:

remove the `NO_ZERO_IN_DATE,NO_ZERO_DATE` in it

check by using

`show variables like 'sql_mode';` in mysql

---

# Nginx

### install
* apt install nginx

### run
* systemctl start nginx

### change port

* `vi /etc/nginx/sites-enabled/default`

```
server {
    listen 8080 default_server;
    listen [::]:8080 default_server;
    ...
}
```
* `systemctl restart nginx`

#### check network tables listening sockets
* `netstat -tlpn | grep nginx`
* `ss -tlpn | grep nginx`

#### simple config

/etc/nginx/sites-available/aries.com
```
server {
    listen 8080;
    server_name www.aries.com;

    location / {
        proxy_pass http://localhost:8000;
    }
}
```

##### add link
* `ln -s /etc/nginx/sites-available/ludianvr.com /etc/nginx/sites-enabled/ludianvr.com`
* `rm /etc/nginx/sites-enabled/default`

##### restart nginx
* `systemctl reload nginx`

## Self sign SSL

`openssl req -newkey rsa:2048 -nodes -out /etc/nginx/ssl/superlists.com.csr -keyout /etc/nginx/ssl/superlists.com.key`

`openssl x509 -req -days 365 -in /etc/nginx/ssl/superlists.com.csr -signkey /etc/nginx/ssl/superlists.com.key -out /etc/nginx/ssl/superlists.com.crt`

```
server {
    listen 8080 ssl;
    listen [::]:8080 ssl;

    ssl_certificate /etc/nginx/ssl/superlists.com.crt;
    ssl_certificate_key /etc/nginx/ssl/superlists.com.key;
    ...
}
```

Add portward on port 80 to port 443

```
server
    {
        listen 80 default_server;
        #listen [::]:80 default_server ipv6only=on;
        ...
        rewrite ^(.*)$ https://$host$1 permanent;
    }
```


### Firewall

ufw default deny
ufw enable

ufw allow <port>
ufw deny <port>

### Static IP

`vi /etc/network/interfaces`

```
auto lo
iface lo inet loopback

auto enp3s0
iface enp3s0 inet static
address 192.168.0.95
netmask 255.255.255.0
broadcast 192.168.0.255
gateway 192.168.0.1
dns-nameservers 192.168.0.1 8.8.8.8

```
ip addr flush enp3s0
systemctl restart networking.service