#!/bin/bash
scripts=("scatter.py" "sigpoll.py" "syscall_archs.py" "syscall_overhead.py" "syscall_profile.py" "wali_macrobench.py")
for i in ${!scripts[@]}; do
	script=${scripts[$i]}
	set -x
	python3 plot/$script
	set +x
done
