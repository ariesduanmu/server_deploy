### Install gunicorn
* pip install gunicorn

Gunicorn 需要知道WSGI服务器的路径，在django中，根目录文件夹中的wsgi.py提供的application函数提供了这个路径

`gunicorn superlists.wsgi:application`

### 换用Unix套接字
为了同时伺服过渡网站和线上网站，两个网站可以共用8000端口
/etc/nginx/sites-available/superlists.com
```
[...]
    location / {
        proxy_set_header Host $host
        proxy_pass http://unix:/tmp/superlists.com.socket;
    }
}
```

### 启动服务

`../virtualenv/bin/gunicorn --bind unix:/tmp/superlists.com.socket superlists.wsgi:application`

### 使用systemd确保引导时启动Gunicorn

/etc/systemd/system/gunicorn-superlists.com.service
```
[Unit]
Description=Gunicorn server for superlists.com

[Service]
Restart=on-failure
User=ludian
WorkingDirectory=/home/ludian/sites/superlists.com/source
ExecStart=/home/ludian/sites/superlists.com/virtualenv/bin/gunicorn --bind unix:/tmp/superlists.com.socket superlists.wsgi:application

[Install]
WantedBy=multi-user.target
```

`systemctl daemon-reload`
`systemctl enable gunicorn-superlists.com`
`systemctl start gunicorn-superlists.com`