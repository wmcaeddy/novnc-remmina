FROM dorowu/ubuntu-desktop-lxde-vnc

RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/99ignore-gpg && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99ignore-gpg

RUN apt-add-repository ppa:remmina-ppa-team/remmina-next -y
RUN apt-get update
RUN apt-get install -y remmina remmina-plugin-rdp
ENV VNC_PASSWORD=mypassword

# Railway requires services to listen on 0.0.0.0, not localhost
ENV BIND_INTERFACE=0.0.0.0

# Expose port 80 (nginx) and 6079 (web service)
EXPOSE 80 6079

# Modify the web service to listen on all interfaces for Railway
# The web service config is at /usr/local/lib/web/backend/run.py
CMD sed -i "s/localhost/0.0.0.0/g" /usr/local/lib/web/backend/run.py && \
    /startup.sh
