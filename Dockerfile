FROM ubuntu:18.04
LABEL maintainer "Bill Plein <bill+github@p3n.cc>"

COPY mbpfan /usr/sbin/mbpfan
RUN apt-get update && apt-get upgrade -y

RUN apt-get -qqy autoremove --purge > /dev/null \
    && apt-get -qqy clean autoclean > /dev/null \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

ENTRYPOINT ["mbpfan", "-f", "-v"]
