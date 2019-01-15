FROM ubuntu:xenial

COPY . /dotfiles

RUN apt-get update
RUN apt-get install -y apt-utils build-essential git locales curl
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN useradd -ms /bin/bash kyle
RUN chown -R kyle /usr/local

USER kyle

CMD /dotfiles/install
