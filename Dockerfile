FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postfix
RUN apt-get install -y dovecot-common dovecot-imapd dovecot-pop3d

RUN useradd bobware
RUN useradd leaf
RUN useradd othniel
RUN useradd joanie
RUN useradd scott

RUN echo "bobware:letmein" | chpasswd
RUN echo "leaf:letmein" | chpasswd
RUN echo "othniel:letmein" | chpasswd
RUN echo "joanie:letmein" | chpasswd
RUN echo "scott:letmein" | chpasswd

ADD ./etc/ /etc/
ADD start-tsh-mail /start-tsh-mail

RUN newaliases

EXPOSE 25 110 143 465 993 995

CMD ["/start-tsh-mail"]