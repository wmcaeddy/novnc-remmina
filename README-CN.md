# 介绍
**novnc-remmina**是一个远程通过浏览器VNC操控内网RDP/VNC/SSH的解决方案。
本方案结合了：novnc和remmina。
优点：这样你可以通过网页访问在防火墙后的远程桌面；在只有80/443的条件下使用远程桌面。

# 快速开始
下载本仓库中的Dockerfile后，在Dockerfile所在目录，你可以通过以下命令进行build和部署
```
docker build -t novnc-remmina .

docker run -d --name=novnc-remmina  -p 6080:80 -p 5900:5900 -e VNC_PASSWORD=mypassword -v /path/on/host/config:/root/.config/remmina -v /path/on/host/share:/root/.local/share/remmina --restart unless-stopped novnc-remmina
```
其实只开放6080端口即可，
在连接http://127.0.0.1:6080并进入桌面后，在 开始菜单-Internet中可以找到Remmina
## 参数解释
VNC_PASSWORD: 你想设置的密码
/root/.config/remmina：这个目录下存储的remmina的配置文件
/root/.local/share/remmina：这个目录下储存着remmina的连接信息，包括密码。


# 完全的手动部署教程
```
docker run -p 6080:80 -p 5900:5900 -e VNC_PASSWORD=mypassword dorowu/ubuntu-desktop-lxde-vnc

本地浏览器通过http://127.0.0.1:6080端口访问并加入noVNC，运行以下命令:

sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp
# 添加 Remmina 的官方 PPA
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
# 更新 Ubuntu 的软件包列表
sudo apt update
# 安装 Remmina 和其 RDP 插件
sudo apt install remmina remmina-plugin-rdp

# 运行remmina
remmina 

```


# 更多
你可以通过nginx进一步反代网页到443端口。dorowu/ubuntu-desktop-lxde-vnc其实本身也可以配置TLS证书，需要的可以研究下。使用https之后，防火墙无法识别出RDP流量。
