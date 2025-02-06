#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
import math
from pathlib import Path


# Parses strace outputs from file
def parse_strace_summary(filename):
    syscalls = {}

    with open(filename, 'r') as file:
        lines = file.readlines()

        for line in lines[2:-2]:  # Skipping the headers
            parts = line.split()
            if len(parts) < 5:
                continue
            
            # Check if the 'errors' column is populated
            if parts[4].isdigit():
                syscall = parts[5]
            else:
                syscall = parts[4]
                
            calls = math.log(int(parts[3]))
            syscalls[syscall] = calls

    return syscalls

def top_n(d):
	N = None
	return list(d)[:N]

def plot_profile(ax, lst):
    vals = np.array(top_n(lst), dtype=float)
    vals /= np.sum(vals)
    p1 = ax.bar(xscale, vals, color='purple')
    

## Preprocess Syscall Profiles
sp_path = Path("syscall_profiles/")
sp_dict = { file.name.split('.')[0]: parse_strace_summary(file) for file in sp_path.iterdir() }

total_sp = {}
for k, v in sp_dict.items():
    for sc, ct in v.items():
        total_sp[sc] = ct if sc not in total_sp else total_sp[sc] + ct

sorted_total_sp = {k: v for k, v in sorted(total_sp.items(), key=lambda item: item[1])[::-1]}
print(sorted_total_sp)
##

apps = {
    "bash": "bash",
    "memcached-testapp": "memcached",
    "sqlite3": "sqlite3"
}


## Plot the syscall profiles
xscale = top_n(sorted_total_sp.keys())

fig, axs = plt.subplots(1+len(apps), 1, figsize=(6, 3.5))

vals = np.array(top_n(sorted_total_sp.values()), dtype=float)
vals /= np.sum(vals)
p1 = axs[0].bar(xscale, vals)
axs[0].text(
    0.98, 0.8, "Aggregate", transform=axs[0].transAxes, ha='right', va='top',
    backgroundcolor='white', fontsize=11)

for ax, (app, desc) in zip(axs[1:], apps.items()):
    sp_app = sp_dict[app]
    sorted_sp = [sp_app[x] if x in sp_app else 0 for x in xscale]
    plot_profile(ax, sorted_sp)
    ax.text(
        0.98, 0.8, desc, transform=ax.transAxes, ha='right', va='top',
        backgroundcolor='white', fontsize=11)

xticks = np.array([0, 20, 40, 60, 80, 100])
for ax in axs:
    ax.grid()
    ax.set_yticks([])
    ax.set_xlim(-2, 102)
    ax.set_xticks(xticks - 0.5)
for ax in axs[:-1]:
    for tick in ax.xaxis.get_major_ticks():
        tick.tick1line.set_visible(False)
        tick.tick2line.set_visible(False)
        tick.label1.set_visible(False)
        tick.label2.set_visible(False)

_ = axs[-1].set_xticklabels(xticks)
fig.tight_layout(h_pad=0.5)

axs[-1].set_ylabel(
    "Relative Frequency $\longrightarrow$", loc='bottom', fontsize=11)
fig.savefig("figures/syscall_profile.pdf", bbox_inches='tight')
##
