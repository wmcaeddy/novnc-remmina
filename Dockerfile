FROM dorowu/ubuntu-desktop-lxde-vnc

RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99ignore-gpg

RUN apt-add-repository ppa:remmina-ppa-team/remmina-next -y
RUN apt-get update
RUN apt-get install -y remmina remmina-plugin-rdp remmina-plugin-vnc
ENV VNC_PASSWORD=bubblete@

# Expose port 80 for nginx (which proxies to the internal services)
EXPOSE 80

# Use the default startup script
CMD /startup.sh
