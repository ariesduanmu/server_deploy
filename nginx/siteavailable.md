*Path /etc/nginx/site-available*

add site config file in here

### HTTP Proxy Sample

```
upstream sample {
        server unix:/tmp/sample.socket;
}
server {
        listen 80 default_server;
        listen [::]:80 default_server;
        charset utf-8;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        location /svnapi {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_pass http://sample;
        }
}

```

### HTTPS Sample

```
upstream sample {
        server 127.0.0.1:8080;
}

server {
        listen 443 ssl;
        listen [::]:443 ssl;
        charset utf-8;
        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;
        ssl_certificate /etc/nginx/ssl/mykey.crt;
        ssl_certificate_key /etc/nginx/ssl/mykey.key;

        server_name _;

        location / {
                
                try_files $uri $uri/ =404;
        }

        location /sample {
                proxy_set_header X-FORWARDED-PROTO https;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_pass http://sample;
        }

}
```


 `ln -s /etc/nginx/sites-available/sample /etc/nginx/sites-enabled/sample`

### self signed ssl

*ssl_certificate, ssl_certificate_key are from self signed ssl*

`openssl req -newkey rsa:2048 -nodes -out /etc/nginx/ssl/superlists.com.csr -keyout /etc/nginx/ssl/superlists.com.key`

`openssl x509 -req -days 365 -in /etc/nginx/ssl/superlists.com.csr -signkey /etc/nginx/ssl/superlists.com.key -out /etc/nginx/ssl/superlists.com.crt`

### Portforward in nginx

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