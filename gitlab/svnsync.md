```yaml
stages:
  - svnsync

variables:
  PIP_CACHE_DIR: "$CI_PROJECT_DIR/pip-cache"
  SVN_ROOT_DIR: "/root"
  SVN_TARGET_DIR: "/newdir"
  
cache:
  paths:
    - "$PIP_CACHE_DIR"
  key: "$CI_PROJECT_ID"


 
# test:
#   stage: test
#   before_script:
#     - python -V
#     - pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
#   script: 
#     - nohup python server/main.py &
#   tags:
#     - wangjiaba-lesson


svnsync:
  stage: svnsync
  image: tetraweb/php:7.1
  before_script:
    - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y ) '
    - mkdir -p ~/.ssh
    - eval $(ssh-agent -s)
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
    - ssh-add <(echo "$SSH_SVNSYNC_KEY")
  script:
    - ssh ludian@192.168.0.1 "cd $SVN_ROOT_DIR && svn update --trust-server-cert --non-interactive"
    - ssh ludian@192.168.0.1 "rm -rf $SVN_ROOT_DIR$SVN_TARGET_DIR"
    - rsync -a --exclude '.git' --exclude '.git/*' . ludian@192.168.0.207:$SVN_ROOT_DIR$SVN_TARGET_DIR
    - ssh ludian@192.168.0.1 "cd $SVN_ROOT_DIR && (svn status --trust-server-cert --non-interactive| grep ^! | awk '{print \$2}' | xargs svn delete --force) && echo 1 || echo 0"
    - ssh ludian@192.168.0.1 "cd $SVN_ROOT_DIR && svn add . --force --trust-server-cert --non-interactive"
    - ssh ludian@192.168.0.1 "cd $SVN_ROOT_DIR && svn commit --trust-server-cert --non-interactive -m 'auto $SVN_TARGET_DIR update from gitlab ci'" 
  tags:
    - svnsync
 ```
