apt-get install memcached
yum

check memchached progress

ps -ef | grep -i memcache

`/usr/bin/memcached -m 64 -p 11211 -u memcache -l 127.0.0.1 -P /var/run/memcached/memcached.pid`

well it is running on port localhost:11211 

let's try `telnet localhost 11211` and enter `stats` we can get some informations

```
STAT pid 1144
...
END
```

set a key value pair in telnet

`set foo 0 3600 3`
`bar`
foo is the key
0 is the flag
3600 is the expire time, which is an hour, when do we want this key value to expire
number of byes for this key value
bar is value

to get the foo just type `get foo`

`delete foo` to delete it

`add num 0 3600 2`
`50`

`append num 0 3600 2`
`25`

`get num` -> `5025`

`prepend num 0 3600 2`
`44`

`get num` -> `445025`

`replace num 0 3600 2`
`40`

`incr num 2`
`decr num 2`

`flush_all`(clear every thing out)


restart memcached
`/etc/init.d/memcached restart`

`apt-get install libmemcached-tools`

tools

`memcstat --servers localhost`
this will give us the same thing as `stats` in telnet can give us

`memcdump --servers localhost`
dump everything

`memccat --servers localhost <key>` this gives us value

`memcrm --severs localhost <key>` this removes the key value pair

`for i in `seq 1000`; do echo $i >> book$i; done`
this create 100 files
`memccp --servers localhost book*`
and this create 1000 key-value pairs

like
`memccat --servers localhost book200`
`200`

`apt-get install python-memcache`
`apt-get install python3-memcache`

```python
import memcache
mc = memcache.Client(['127.0.0.1:11211'], debug=0)
mc.set('greet', 'Hello world')
mc.get('greet')
```

apt-get install php7.0 libapach2-mod-php7.0
apt-get install php-memcache







   

