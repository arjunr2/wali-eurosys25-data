#!/bin/bash

for i in {1..5}
do
  taskset -c 6 chrt -f 98 ./btime ./bash.aot data/fibonacci.sh 10000
done
