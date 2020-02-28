### Install
* apt install nginx

### Start/Restart/Reload
* systemctl start nginx
* systemctl reload nginx
* systemctl restart nginx

### Config Path

*Ubuntu*
* /etc/nginx

### Limit File Upload Size

```
http {
    ...
    client_max_body_size 100M;
}    
```

```
server {
    ...
    client_max_body_size 100M;
}
```

```
location /uploads {
    ...
    client_max_body_size 100M;
} 
```
