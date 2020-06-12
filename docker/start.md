* `git clone https://github.com/docker/getting-started.git`
* `cd getting-started`
* `docker build -t docker101tutorial .`
* `docker run -d -p 80:80 --name docker-tutorial docker101tutorial`
* `docker tag docker101tutorial <username>/docker101tutorial`
* `docker push <username>/docker101tutorial`