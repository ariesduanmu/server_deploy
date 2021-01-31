## Step 1: Installing LAMP Stack Environment

* `dnf -y update`

#### Install PHP

* `dnf -y install yum-utils`
* `dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm`
* `dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm`
* `dnf module reset php`
* `dnf module install php:remi-7.3`
* `yum -y install wget php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}`

#### Install LAM (Linux, Apache, MySQL)

* `yum install httpd pcre pcre-devel zlib-devel mariadb-server`
* `systemctl enable apache mariadb`
* `systemctl enable httpd mariadb`
* `mysql_secure_installation`
* `vi /etc/php.ini` change `upload_max_filesize = 20M`
* `systemctl restart httpd`

## Step 2: Create SuiteCRM Database

```
$ mysql -u root -p
MariaDB [(none)]> CREATE DATABASE suitecrm_db;
MariaDB [(none)]> CREATE USER 'crmadmin'@'localhost' IDENTIFIED BY 'crmsys@dmin$12';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON suitecrm_db.* TO 'crmadmin'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> exit;
```

## Step 3: Installing SuiteCRM

* Download Package from `https://suitecrm.com/download/`
* unzip it and sent to `/var/www/html` rename the directory to `suitecrm`

* `cd suitecrm/`
* `chown -R apache:apache .`
* `sudo chmod -R 755 .`
* `chmod -R 775 cache custom modules themes data upload`
* `chmod 775 config_override.php 2>/dev/null`

* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/custom(/.*)?'`
* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/cache(/.*)?'`
* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/modules(/.*)?'`
* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/upload(/.*)?'`
* `restorecon -R .`

* `touch config.php`
* `chown apache:apache config.php`
* `chmod 775 config.php`
* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/config.php'`
* `restorecon -R .`

* `touch .htaccess`
* `chown apache:apache .htaccess`
* `chmod 775 .htaccess`
* `semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/suitecrm/.htaccess'`
* `restorecon -R .`
