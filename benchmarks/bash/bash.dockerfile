FROM ubuntu:22.04
ADD bash /
COPY data /data
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./bash"]
