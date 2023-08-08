#!/bin/bash

i=65536
cur_dir="tdir_262144/tdir_131072/"
set -x
while [ $i -ge 16 ]
do
  cur_dir+="tdir_$i/"
  ./btime sshpass -p "ag99" scp -r $cur_dir 192.168.2.128:~/ > scp_$i.wali
  i=$(($i/2))
done
