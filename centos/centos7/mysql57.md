## yum-config-manager找不到

yum -y install yum-utils

## mysql5.7 在centos上的安装

* yum localinstall mysql80-community-release-el7-3.noarch.rpm
* yum repolist enabled | grep "mysql.*-community.*"
* yum repolist all | grep "mysql"
* yum-config-manager --enable mysql57-community
* yum-config-manager --disable mysql80-community
* yum install mysql-community-server
* yum install mysql-community-client
* systemctl start mysqld.service
* systemctl status mysqld.service
* less /etc/my.cnf

* grep 'temporary password' /var/log/mysqld.log
* mysql -u root -p
* SET PASSWORD = PASSWORD('NEW_PASSWORD');

## uninstall

* rpm -qa | grep mysql | yum remove