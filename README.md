# Introduction
**novnc-remmina** is a solution for remotely controlling intranet RDP/VNC/SSH through browser VNC.
This solution combines: novnc and remmina.
Advantages: This way you can access the remote desktop behind the firewall through the web; use remote desktop under only 80/443 conditions.

# Quick start
After downloading the Dockerfile in this warehouse, you can build and deploy through the following commands in the directory where the Dockerfile is located.
```
docker build -t novnc-remmina .

docker run -d --name=novnc-remmina -p 6080:80 -p 5900:5900 -e VNC_PASSWORD=mypassword -v /path/on/host/config:/root/.config/remmina -v /path/on /host/share:/root/.local/share/remmina --restart unless-stopped novnc-remmina
```
In fact, only port 6080 can be opened.
After connecting to http://127.0.0.1:6080 and entering the desktop, Remmina can be found in the Start Menu - Internet
## Parameter explanation
VNC_PASSWORD: the password you want to set
/root/.config/remmina: The remmina configuration file stored in this directory
/root/.local/share/remmina: This directory stores remmina connection information, including passwords.


# Complete manual deployment tutorial
```
docker run -p 6080:80 -p 5900:5900 -e VNC_PASSWORD=mypassword dorowu/ubuntu-desktop-lxde-vnc

Access the local browser through port http://127.0.0.1:6080 and join noVNC, run the following command:

sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp
# Add Remmina’s official PPA
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
# Update Ubuntu package list
sudo apt update
# Install Remmina and its RDP plugin
sudo apt install remmina remmina-plugin-rdp

# Run remmina
remmina

```


# More
You can further reverse-generate the web page to port 443 through nginx. dorowu/ubuntu-desktop-lxde-vnc can actually configure TLS certificates itself, you can research it if needed. After using https, the firewall cannot recognize RDP traffic.