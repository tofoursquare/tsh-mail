FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y postfix
RUN apt-get install -y dovecot-common

ADD ./etc/bind /etc/bind
ADD start-tsh-dns /start-tsh-dns

RUN newaliases

RUN useradd
RUN useradd
RUN useradd
RUN useradd
RUN useradd
RUN useradd

EXPOSE 53

CMD ["/start-tsh-dns"]