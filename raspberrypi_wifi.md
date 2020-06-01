* `iwlist wlan0 scan | grep <SSID>`
* `wpa_passphrase <SSID> <password>`

```
network={
        ssid="SSID"
        #psk="password"
        psk=<psk cipher>
}
```

* `wpa_passphrase <SSID> <password> >> /etc/wpa_supplicant/wpa_supplicant.conf`

* `systemctl restart networking`
* `ifdown wlan0`   
* `ifup wlan0`     
* `wpa_cli status` 
