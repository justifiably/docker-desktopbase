FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-key update && apt-get update ; apt-get install -y curl; apt-get upgrade -y

RUN curl http://winswitch.org/gpg.asc | apt-key add - \
 && echo "deb http://winswitch.org/ xenial main" >> /etc/apt/sources.list.d/xpra.list \
 && apt-get update \
 && apt-get install -y sudo xpra lxterminal \
 && apt-get remove -y curl && apt-get autoremove -y \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1001 -ms /bin/bash user \
 && adduser user sudo \
 && echo "user ALL = NOPASSWD: ALL" > /etc/sudoers.d/user-freepass-unsafe

ADD xpra-start.sh /usr/local/bin

VOLUME ["/home/user"]

EXPOSE 33333

CMD ["/usr/local/bin/xpra-start.sh"]

