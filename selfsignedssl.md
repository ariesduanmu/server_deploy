`openssl req -newkey rsa:2048 -nodes -out /etc/nginx/ssl/superlists.com.csr -keyout /etc/nginx/ssl/superlists.com.key`

`openssl x509 -req -days 365 -in /etc/nginx/ssl/superlists.com.csr -signkey /etc/nginx/ssl/superlists.com.key -out /etc/nginx/ssl/superlists.com.crt`