# MySQL

## install mysql

* apt install mysql-client-core-5.7 -y
* apt install mysql-client-5.7
* apt install mysql-server

### Run the security script

* mysql_secure_installation

### Test mysql

* systemctl status mysql.service

*if mysql is nto running `systemctl start mysql`*

### Add user

* mysql> use mysql;
* mysql> create user 'aries'@'localhost' identified by 'password';
* mysql> create database aries;
* mysql> grant all privileges on aries.* to "aries"@"localhost";
* mysql> FLUSH PRIVILEGES;


### update password

* mysql> update user set authentication_string=PASSWORD("password") where User="aries";
* mysql> FLUSH PRIVILEGES;

### Invalid default value for 'date_available'

`/etc/mysql/mysql.conf.d/mysqld.cnf`

```
[mysqld]
sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

```

ATTENTION:

remove the `NO_ZERO_IN_DATE,NO_ZERO_DATE` in it

check by using

`show variables like 'sql_mode';` in mysql

---
