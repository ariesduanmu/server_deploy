### Create

#### 1. Create a Base Container

`docker create --name nginx_base -p <host port>:<docker port> nginx:alpine`

#### 2. Inspect Images

`docker images`

#### 3. Inspect Containers

`docker ps -a`

#### 4. Start the Container

`docker start nginx_base`

#### 5. Send file to Contaier

`docker cp <localfile> nginx_base:<remote file path>`

#### 6. Create an Image from a Container

`docker commit nginx_base`

#### 7. Tag the Image

* list: `docker images`
* tag: `docker tag <IMAGE ID> <Tag name>`

#### 6&7. Create Images with Tags

*another choice for step 6 and 7*

`docker commit nginx_base <Tag name>`



### Delete

#### Puring all unused or dangling images/containers/volumes/networks

`docker system prune`

#### Remove Docker Images

* list all images: `docker images -a`
* remove specific image: `docker rmi <Image>`

#### Remove dangling images

* list: `docker images -f dangling=true`
* remove: `docker images purge`

#### Remove Containers

* list: `docker ps -a`
* remove: `docker rm <ID_or_Name> <ID_or_Name>`


[doc](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)

### Save Image

`docker save nginx > nginx_base.tar`

### Load Image

* `docker load --input nginx_base.tar`