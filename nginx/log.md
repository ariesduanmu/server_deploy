*Path /etc/nginx/nginx.conf*

```
http {
    log_format vhost '$host $remote_addr - $remote_user [$time_local]'
                     '"$request" $status $body_bytes_sent '
                     '"$http_referer" "$http_user_agent"';
    log_format lists '$time_iso8601 $host $remote_addr '
                     '"$request" $status $body_bytes_sent $request_time';

    access_log /var/log/nginx/access.log vhost;


}
```