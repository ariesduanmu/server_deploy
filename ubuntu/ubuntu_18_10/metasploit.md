## INSTALL METASPLOIT DEPENDENCIES

* `sudo apt-get install gpgv2 autoconf bison build-essential curl git-core libapr1 libaprutil1 libcurl4-openssl-dev libgmp3-dev libpcap-dev libpq-dev libreadline6-dev libsqlite3-dev libssl-dev libsvn1 libtool libxml2 libxml2-dev libxslt-dev libyaml-dev locate ncurses-dev openssl postgresql postgresql-contrib wget xsel zlib1g zlib1g-dev`

## CONFIGURE THE POSTGRES DATABASE

* `sudo su postgres`
* `createuser msfuser -S -R -P`
* `createdb msfdb -O msfuser`
* `exit`
* `sudo update-rc.d postgresql enable`

## INSTALL & CONFIGURE RVM

* `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

* `curl -sSL https://get.rvm.io | bash`

*the ip is blocked for me, so  I just open it on broswer and save manually*

* `source ~/.rvm/scripts/rvm`

## DOWNLOAD & INSTALL METASPLOIT FRAMEWORK

* `git clone https://github.com/rapid7/metasploit-framework.git`

*or just download source code from release, it is fatser for me*

* `cd metasploit-framework/`

*my download is version 5.0.72*
```
aries@ubuntu:~$ cd metasploit-framework-5.0.72/
Required ruby-2.6.5 is not installed.
To install do: 'rvm install "ruby-2.6.5"'
```

* `rvm install "ruby-2.6.5"`
* `gem install bundler`
* `bundle install`

## CONFIG DATABASE

* `cd config`
* `cp database.yml.example database.yml`
* `vi database.yml`

```
# To set up a metasploit database, follow the directions hosted at:
# http://r-7.co/MSF-DEV#set-up-postgresql
#
# Kali Linux and the Omnibus installers both include an easy wrapper script for
# managing your database, which may be more convenient than rolling your own.

development: &pgsql
  adapter: postgresql
  database: msfdb
  username: msfuser
  password: ITISASECRET
  host: localhost
  port: 5432
  pool: 5
  timeout: 5

# You will often want to seperate your databases between dev
# mode and prod mode. Absent a production db, though, defaulting
# to dev is pretty sensible for many developer-users.
production: &production
  <<: *pgsql

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
#
# Note also, sqlite3 is totally unsupported by Metasploit now.
test:
  <<: *pgsql
  database: msfdb

```

## READY GO

* `./msfconsole`
