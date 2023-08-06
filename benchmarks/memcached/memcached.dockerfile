FROM ubuntu:20.04
ADD memcached testapp /
RUN apt-get -y update
RUN apt-get install -y libevent-dev
SHELL ["/bin/bash", "-c"]
#ENTRYPOINT ["./testapp"]
