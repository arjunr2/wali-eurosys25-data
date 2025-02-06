#!/usr/bin/env python

import matplotlib.pyplot as plt
from pathlib import Path
from syscall_profile import get_sorted_sp, top_n
import re

## Parse file to get syscall NRs index dict\n",
#  sysidx_dict: Map SC to number\n",
#  syscall_names: Map number to SC\n",
#  call_freq_scale: Sorted by aggregate\n",
syscall_names = [None] * 500
with open("meta/syscall_list.nr", "r") as f:
    pattern = re.compile(r"__NR_(\S*)\s+(\d+)")
    matches = [pattern.search(line) for line in f.readlines()]
    sysidx_dict = {match.group(1): int(match.group(2)) for match in matches}
    for k, v in sysidx_dict.items():
        syscall_names[v] = k

call_freq_scale = sorted(sysidx_dict, key=sysidx_dict.get)
##

## Process microbenchmark outputs
micro_path = Path("microbenchmarks")
nprof_path = micro_path / "native_profiles"

def profile_dict(profile_file):
    with open(profile_file) as f:
        list_stats = f.read().split(',')
        fields = ["count", "native", "virtual"]
        feats = [dict(zip(fields, [int(x) for x in re.search("(\d*):(\d*)/(\d*)", elem).groups()])) for elem in list_stats]
        for i, ft in enumerate(feats):
            final_dict = {syscall_names[i]: ft for i, ft in enumerate(feats)}
            for k, v in final_dict.items():
                final_dict[k]["overhead"] = final_dict[k]["virtual"] - final_dict[k]["native"]
            return final_dict

ndict_all = {pt.name.split('.')[0]: profile_dict(pt) for pt in nprof_path.iterdir()}

ndict_comp = {}
for sc in syscall_names:
    sc_fts = [v[sc] for v in ndict_all.values()]
    ov = 0
    ct = 0
    for ft in sc_fts:
        ov += int(ft['overhead']) * int(ft['count'])
        ct += int(ft['count'])
    ndict_comp[sc] = int(ov / ct) if ct else 0
    


# Parameters to print
x = 35
# Remove uninteresting calls, and add interesting ones
rm_list = ['clock_nanosleep', 'brk', 'arch_prctl', 'set_robust_list', 'dup2', 'openat', 'execve']
add_list = ['open', 'fork']

_, sorted_sp_dict = get_sorted_sp()
xscale = top_n(sorted_sp_dict.keys())
micro_xscale = [i for i in xscale[:x] if i not in rm_list]
micro_xscale.insert(3, 'open')
micro_xscale.append('fork')

with open("figures/syscall_overheads.txt", 'w') as f:
	print ("{:<20} {:<10}".format('Syscall', 'Overhead (ns)'), file=f)
	topx_dict = {k: ndict_comp[k] for k in micro_xscale[:x]}
	for k, v in topx_dict.items():
		print ("{:<20} {:<10}".format(k, v), file=f)
	print("NOTES: Timing fork is non-deterministic since it depends on how the processes get scheduled. "
	"It however is a trivial passthrough, and we report  this with a manual test", file=f)

