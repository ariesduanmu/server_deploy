## nginx&apache

yum install epel-release
yum install nginx
systemctl enable nginx
yum install httpd
systemctl enable httpd


netstat -tlpn| grep nginx
ss -tlpn| grep nginx

yum install policycoreutils
semanage port -a -t http_port_t -p tcp 8081
semanage port -m -t http_port_t -p tcp 8081