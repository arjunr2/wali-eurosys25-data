#!/bin/bash
make sigtest MODE=signone
make sigtest MODE=sigloop
make sigtest MODE=sigall
make sigtest MODE=sigfunc
