## install git from source


* `yum install git`

* `sudo adduser git`
* `su git`
* `cd`
* `mkdir .ssh && chmod 700 .ssh`
* `touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys`

### example

* `mkdir /home/git/example.git`
* `cd /home/git/example.git`
* `git init --bare`

### client

* `git clone git@192.168.2.102:/home/git/example.git`

*need to input git password*

### use ssh

*generate rsa keys local*

* `ssh-keygen -t rsa`
*this will save `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`
 as default*

*transport this pub key to git server(example by using scp)*

* `cat id_rsa.pub >> /home/git/.ssh/authorized_keys`


