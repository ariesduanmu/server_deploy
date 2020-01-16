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
