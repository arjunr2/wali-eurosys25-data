FROM ubuntu:20.04
ADD lua /
COPY data /
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ./lua binarytrees.lua 13;
