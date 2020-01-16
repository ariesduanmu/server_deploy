check interfaces
`ip a`

Location
`/etc/sysconfig/network-scripts/`

Edit/Create interface config(example interface enp0s8)
`vi ifcfg-enp0s8`

```conf
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none

IPADDR=192.168.0.211
PREFIX=24
GATEWAY=192.168.0.1

DNS1=192.168.0.1
DNS2=8.8.8.8
DEFROUTE=yes
IPV4_FAILURE_FATAL=no

NAME=enp0s8
# This is system specific and can be created using 'uuidgen eth0' command #
UUID=7057a690-69b2-4152-b4c3-9271f767f5ec
DEVICE=enp0s8
ONBOOT=yes
```

Restart network service
`systemctl restart network`

