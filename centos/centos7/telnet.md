## install telnet

* yum install telnet-server telnet

## enable telnet

* firewall-cmd --add-service=telnet --zone=public

*Run the rule again with the “–permanent” flag for it to persist across firewalld restarts.*

* firewall-cmd --add-service=telnet --zone=public --permanent

* systemctl start telnet.socket
* systemctl enable telnet.socket