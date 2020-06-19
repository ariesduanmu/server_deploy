```yaml
stages:
  - test

variables:
  PIP_CACHE_DIR: "$CI_PROJECT_DIR/pip-cache"
  
cache:
  paths:
    - "$CI_PROJECT_DIR/pip-cache"
  key: "$CI_PROJECT_ID"

before_script:
  - python -V
  - pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
 
test:
  stage: test
  script: 
    - nohup python main.py &
  tags:
    - tag
```