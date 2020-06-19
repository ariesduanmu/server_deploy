stages:
  - build

 
deploy:
  stage: build
  image: tetraweb/php:7.1
  before_script:
    - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y ) '
    - mkdir -p ~/.ssh
    - eval $(ssh-agent -s)
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
    - ssh-add <(echo "$SSH_PRIVATE_KEY")
  script:
    - rsync -r source root@192.168.0.10:/path/to/directory
    - ssh -tt root@192.168.0.10 "echo '$ROOT_KEY' | sudo -S supervisorctl restart server"
  tags:
    - doc