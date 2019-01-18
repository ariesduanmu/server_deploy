#### Install visualSVN server
* apt install subversion libapache2-mod-svn libsvn-dev -y
* apt install apache2 -y
* su
* a2enmod dav ; a2enmod dav_svn ; systemctl restart apache2
* a2enmod authz_svn
* gedit /etc/apache2/mods-enabled/dav_svn.conf

```
SVNUseUTF8 On
<Location /svn>
  DAV svn
  SVNParentPath /var/lib/svn

  AuthType Basic
  AuthName "Subversion Repository"
  AuthUserFile /etc/apache2/dav_svn.passwd
  AuthzSVNAccessFile /var/lib/svn/conf/authz
  Require valid-user
  SSLRequireSSL
</Location>

```
## Auth
adduser svnuser 
addgroup subversion 
addgroup svnuser subversion

## Setup Apache Subversion With SSL

* a2enmod ssl
* apt install ssl-cert
* /usr/sbin/make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/apache2/ssl/apache.pem


* nano /etc/apache2//sites-available/svnserver.conf
```
<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache.pem
    SSLProtocol all
    SSLCipherSuite HIGH:MEDIUM
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    SVNUseUTF8 On
    <Location /svn>
        DAV svn
        SVNParentPath /var/lib/svn

        AuthType Basic
        AuthName "Subversion Repository"
        AuthUserFile /etc/apache2/dav_svn.passwd
        AuthzSVNAccessFile /var/lib/svn/conf/authz
        Require valid-user
        SSLRequireSSL
    </Location>

</VirtualHost>

```
* a2dissite 000-default.conf
* a2dissite default-ssl.conf
* a2ensite svnserver.conf

#### Create repo

* mkdir -p /var/lib/svn/
* svnadmin create /var/lib/svn/myrepo
* chown -R root:subversion /var/lib/svn/myrepo
* chown -R www-data:www-data /var/lib/svn/myrepo
* chmod -R g+rws /var/lib/svn/myrepo
* htpasswd -cm /etc/apache2/dav_svn.passwd admin
* htpasswd -m /etc/apache2/dav_svn.passwd user1
* htpasswd -m /etc/apache2/dav_svn.passwd user2

* systemctl reload apache2


#### SVN checkout on Linux

* svn co --username=username --password=password [svn repo address]

#### SVN import on Linux

* svn import --username=username --password=password <source> [svn repo address]+<source>

#### Check svn install

use brown open "http://192.168.0.95/svn/myrepo"

---
