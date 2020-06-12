* check `docker info` 

```
...
Docker Root Dir: /var/lib/docker
...
```

* stop `service docker stop`
* Copy the current data directory to the new one `mv /var/lib/docker/ /path/to/your/docker`
* link `ln -s /path/to/your/docker /var/lib/docker/`
* start `service docker start`