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

## mount

vi /etc/fstab

```
...
UUID=<disk uuid> <mount point> ext4 defaults 0 0
```

`mount -a`

### ssh server

* apt install openssh-server

#### check ssh server status

* service ssh status

#### ssh server conifg path

* /etc/ssh/sshd_config

### Remote Desktop

https://linuxconfig.org/ubuntu-remote-desktop-18-04-bionic-beaver-linux

#### Enable remote sharing

Settings > Sharing > Screen Sharing (Active)

#### once remote desktop feature is enabled, system will listening on port 5900

* ss -lnt

Enable ufw (if needed)

* ufw allow from any to any port 5900 proto tcp

#### Remina to connect to remote desktop

* apt install remmina & remmina

#### Ubuntu with multiple ip

`/etc/network/interface`

```
auto lo
iface lo inet loopback

auto enp3s0:1
iface enp3s0:1 inet static
    address 192.168.0.92
    netmask 255.255.255.0
    gateway 192.168.0.1
    dns-nameservers 192.168.0.1 8.8.8.8 8.8.4.4
```

### ssh for particular ip

`/etc/ssh/sshd_config`

```
#ListenAddress 0.0.0.0
ListenAddress 192.168.0.92
```