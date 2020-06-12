### 1. get srs

* `git clone https://github.com/ossrs/srs`
* `cd srs/trunk`

### 2. config docker env

* `docker pull ossrs/srs:dev`
* `docker run -it -v <host srs path>:/tmp/srs -w /tmp/srs/trunk -p <host port>:1935 -p <host port>:1985 -p <host port>:8080 -p <host port>:8085 ossrs/srs:dev bash`

### 3. compile in docker

* `./configure && make`

### 4. run srs

* `./objs/srs -c conf/srs.conf`