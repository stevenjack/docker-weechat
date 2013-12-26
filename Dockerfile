FROM stackbrew/ubuntu:raring
MAINTAINER Simon Thulbourn <simon+github@thulbourn.com>

RUN apt-get -qq update
RUN apt-get install -y weechat

RUN adduser sthulb
USER sthulb

RUN mkdir -p /home/sthulb
RUN chown -R sthulb:sthulb /home/sthulb

RUN mkdir -p /home/sthulb/.weechat/python/autoload
ADD shell.py /home/sthulb/.weechat/python/shell.py
RUN ln -s /home/sthulb/.weechat/python/shell.py /home/sthulb/.weechat/python/autoload/shell.py

ADD irc.conf /home/sthulb/.weechat/

ENV HOME /home/sthulb
ENV LANG en_GB.UTF-8
ENV TERM screen-256color

ENTRYPOINT weechat-curses
