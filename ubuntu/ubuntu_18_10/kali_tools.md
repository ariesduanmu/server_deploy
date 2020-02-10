## Katoolin(Kali Tools Installer)

* sudo apt-get install python git -y
* wget -q -O - archive.kali.org/archive-key.asc | sudo apt-key add -
* git clone https://github.com/LionSec/katoolin.git
* sudo cp katoolin/katoolin.py /usr/bin/katoolin
* sudo chown root:root /usr/bin/katoolin
* sudo chmod +x /usr/bin/katoolin

*usage*

* sudo katoolin