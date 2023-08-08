#!/bin/bash

base_size=262144 #KB
cur_dir=""

while [ $base_size -ge 16 ]
do
  echo $base_size
  cur_dir+="tdir_$base_size/"
  mkdir -p $cur_dir
  for (( c=0; c<=$(($base_size/16)); c++))
  do
    head -c 16K </dev/urandom > $cur_dir/tfile_$c
  done
  base_size=$(($base_size/2))
done

