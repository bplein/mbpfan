FROM ubuntu:18.04
LABEL maintainer "Bill Plein <bill+github@p3n.cc>"

RUN apt-get update \
    && apt install -y mbpfan \
#    && apt-get -y upgrade \ 
    && mkdir -p /etc/mbpfan
COPY mbpfan.conf* /etc/mbpfan/

RUN mv /etc/mbpfan.conf /etc/mbpfan/mbpfan.orig 

ENTRYPOINT ["mbpfan", "-f", "-v"]
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"