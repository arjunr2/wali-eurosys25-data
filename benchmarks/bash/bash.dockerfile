FROM ubuntu:20.04
ADD bash /
COPY data /data
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./bash"]
