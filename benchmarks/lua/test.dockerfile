FROM ubuntu:22.04
ADD lua /
COPY data /data
SHELL ["/bin/bash", "-c"]
