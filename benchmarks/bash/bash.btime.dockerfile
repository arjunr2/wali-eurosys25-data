FROM ubuntu:22.04
ADD bash /
COPY data /data
COPY btime /
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./btime"]
