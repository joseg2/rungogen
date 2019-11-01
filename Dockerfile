FROM ubuntu:19.10

RUN sed -i 's|/archive|/au.archive|' /etc/apt/sources.list ; apt-get update ; DEBIAN_FRONTEND=noninteractive apt-get -y install wget
RUN wget -q -O /usr/local/bin/gogen https://api.gogen.io/linux/gogen && chmod 755 /usr/local/bin/gogen

CMD tail -f /var/log/bootstrap.log
