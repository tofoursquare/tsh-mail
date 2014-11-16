FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postfix
RUN apt-get install -y dovecot-common

RUN useradd bobware
RUN useradd leaf
RUN useradd othniel
RUN useradd joanie
RUN useradd scott

RUN echo "letmein:bobware" | chpasswd
RUN echo "letmein:leaf" | chpasswd
RUN echo "letmein:othniel" | chpasswd
RUN echo "letmein:joanie" | chpasswd
RUN echo "letmein:scott" | chpasswd

ADD ./etc/ /etc/
ADD start-tsh-mail /start-tsh-mail

RUN newaliases

EXPOSE 25 110 143 465 993 995

CMD ["/start-tsh-mail"]