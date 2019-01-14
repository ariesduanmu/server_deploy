### Pakage needed

* nginx
* python3.6
* virtual+pip

#### Example

* Linux(Ubuntu-18.04-Desktop-amd64)

* apt install nginx
* apt install python3
* apt install python3-dev
* apt install python3-pip
* apt-get install python3-venv
* cd SITENAME && python3 -m venv virtualenv
* echo "django\ngunicorn" >> requirements.txt
* sudo ../virtualenv/bin/pip install -r requirements.txt

### Directory structure

/home/aries/sites/

```bash
/home/aries
|--sites
   |--SITENAME
   |  |--database
   |  |  |--db.sqlite3
   |  |
   |  |--source
   |  |  |--main.py
   |  |  |--etc..
   |  |
   |  |--static
   |  |  |--home.html
   |  |  |--etc..
   |  | 
   |  |--virtualenv
   |     |--etc..
   |
   |--etc..
```

### Ngnix config

sample as nginx.template.conf and put it in path /etc/nginx/sites-enabled/SITENAME

* ln -s /etc/nginx/sites-available/SITENAME /etc/nginx/sites-enabled/SITENAME
* rm /etc/nginx/sites-enabled/default

#### Restart ngnix
* systemctl reload nginx

### Systemd config

sample as gunicorn-systemd.service and put it in path /etc/systemd/system/gunicorn-systemd.service

#### install gunicorn
* /home/aries/sites/SITENAME/virtualenv/bin/pip install gunicorn

#### restart systemd

* systemctl daemon-reload
* systemctl enable gunicorn-superlists.com
* systemctl start gunicorn-superlists.com