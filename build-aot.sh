#!/bin/bash
make build-aot MODE=signone
make build-aot MODE=sigloop
make build-aot MODE=sigall
make build-aot MODE=sigfunc
