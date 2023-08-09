#!/bin/bash

steps=16
step_dir="sdir_$steps/"

while [ $steps -ge 1 ]
do
	mkdir -p $step_dir
	base_size=16 #KB
	file_size=1 #KB
	cur_dir="$step_dir"

	while [ $base_size -ge 1 ]
	do
	  echo $base_size
	  cur_dir+="tdir/"
	  mkdir -p $cur_dir
	  for (( c=0; c<$((($base_size/2)*($file_size))); c++))
	  do
	    head -c ${file_size}K </dev/urandom > $cur_dir/tfile_$c
	  done
	  base_size=$(($base_size/2))
	done

	steps=$(($steps-1))
	step_dir+="sdir_$steps/"
done


