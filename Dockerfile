FROM dorowu/ubuntu-desktop-lxde-vnc

RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99ignore-gpg

RUN apt-add-repository ppa:remmina-ppa-team/remmina-next -y
RUN apt-get update
RUN apt-get install -y remmina remmina-plugin-rdp
ENV VNC_PASSWORD=mypassword

# Railway will set PORT environment variable
ENV PORT=${PORT:-80}
EXPOSE ${PORT}

# Override the default port 80 to use Railway's PORT
# Update nginx to listen on the PORT and proxy to the web service on 6079
CMD sed -i "s/listen 80/listen ${PORT}/g" /etc/nginx/sites-enabled/default && \
    sed -i "s/listen \[::\]:80/listen \[::\]:${PORT}/g" /etc/nginx/sites-enabled/default && \
    /startup.sh
