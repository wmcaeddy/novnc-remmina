FROM dorowu/ubuntu-desktop-lxde-vnc

RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99ignore-gpg

RUN apt-add-repository ppa:remmina-ppa-team/remmina-next -y
RUN apt-get update
RUN apt-get install -y remmina remmina-plugin-rdp
ENV VNC_PASSWORD=mypassword

# Railway will set PORT environment variable, default to 6081
ENV PORT=6081
EXPOSE ${PORT}

# Override the default port 80 to use Railway's PORT
CMD sed -i "s/80/${PORT}/g" /usr/local/lib/web/backend/vnc-auto.html && \
    sed -i "s/80/${PORT}/g" /usr/local/lib/web/backend/vnc.html && \
    sed -i "s/:80/:${PORT}/g" /etc/nginx/sites-enabled/default && \
    /startup.sh
