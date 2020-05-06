## nmap

* yum install nmap


## rabbitmq

* yum install rabbitmq-server

* systemctl start rabbitmq-server.service
* systemctl enable rabbitmq-server.service

```
rabbitmqctl add_user myuser mypassword  # 新增用户
rabbitmqctl add_vhost myvhost  # 新增vhost，以使用不同的命名空间
rabbitmqctl set_permissions -p myvhost myuser ".*" ".*" ".*"  # 设置权限
rabbitmqctl  delete_user guest  # 安全原因，删除guest
```


## SSH

* yum install openssh-server
* systemctl start sshd
* systemctl enable sshd

#### ssh server conifg path

* /etc/ssh/sshd_config