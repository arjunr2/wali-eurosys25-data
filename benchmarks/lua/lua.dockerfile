FROM ubuntu:20.04
ADD lua /
COPY data /data
SHELL ["/usr//bin/bash", "-c"]
ENTRYPOINT ["/usr/bin/bash", "time",  "./lua"]
