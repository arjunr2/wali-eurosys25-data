FROM ubuntu:20.04
ADD lua /
COPY data /data
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./lua"]
