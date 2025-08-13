FROM dorowu/ubuntu-desktop-lxde-vnc

RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99ignore-gpg

RUN apt-add-repository ppa:remmina-ppa-team/remmina-next -y
RUN apt-get update
RUN apt-get install -y remmina remmina-plugin-rdp
ENV VNC_PASSWORD=mypassword

# Expose port 80 (nginx) and 6079 (web service)
EXPOSE 80 6079

# Use the default startup script without modifications
CMD /startup.sh
