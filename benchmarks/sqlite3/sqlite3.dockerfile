FROM ubuntu:20.04
ADD sqlite3 /
COPY data /data
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["./sqlite3"]
