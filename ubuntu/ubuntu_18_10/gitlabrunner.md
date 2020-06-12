### Download

Sources: `https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html`

I choose the `deb/gitlab-runner_amd64.deb` one

### Install

* `dpkg -i gitlab_runner_amd64.deb`

### Run

* `gitlab-runner`


### Run gitlab in docker
`docker run -d --name gitlab-runner --restart always -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest`