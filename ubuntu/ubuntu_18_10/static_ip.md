# Static IP

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