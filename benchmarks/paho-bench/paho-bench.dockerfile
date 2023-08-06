FROM ubuntu:20.04
ADD paho-bench /
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./paho-bench"]
