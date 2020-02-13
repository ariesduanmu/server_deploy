## install

*download the version you want from http://download.redis.io/releases/ mine is 4.0.9*

* `tar -xvzf redis-4.0.9.tar.gz`
* `cd redis-4.0.9`
* `yum install gcc`
* `cd deps`
* `make hiredis jemalloc linenoise lua`
* `cd ..`
* `make && make install`

* `utils/install_server.sh`

## Check redis server

* `/etc/init.d/redis_6379 status`
* `redis-cli -p 6379 info server`

## Run Redis commands using redis-cli client

* `redis-cli`

## able for remote visit

* `vim /etc/redis/6379.conf`
*change `bind 127.0.0.1` to `0.0.0.0`*
*remember to check the firewall* 
