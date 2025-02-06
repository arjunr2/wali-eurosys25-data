#!/usr/bin/env python

import matplotlib.pyplot as plt

# Syscall By Arch
num_x86_calls = 608 - 247 + 1
unique_calls = {
    "x86_64": 56,
    "aarch64": 0,
    "rv64": 2
}

common_calls = num_x86_calls - unique_calls["x86_64"]
archs = ["x86_64", "rv64", "aarch64"]

syscall_archs = {}
for arch in archs:
    syscall_archs[arch] = {
        "common": common_calls,
        "unique": unique_calls[arch]
    }


# Plot architecture similarities
fig, ax = plt.subplots()
fig.set_figheight(1.5)

keys = list(syscall_archs.keys())
common_vals = [x["common"] for x in syscall_archs.values()]
unique_vals = [x["unique"] for x in syscall_archs.values()]

colors = ["green", "orange"]
labels = ["common", "arch-specific"]
lefts = [0, 0, 0]
b = []
for bars, col, label in zip([common_vals, unique_vals], colors, labels):
    #print(keys, bars, col, lefts, label)
    b = ax.barh(keys, bars, left=lefts, color=col, height=0.6, label=label)
    lefts = [lefts[i] + bars[i] for i in range(len(common_vals))]

ax.set_xlim(right=550)
ax.spines['top'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.xaxis.grid(linestyle='dashed')
ax.legend(title="Syscall Implementation", loc="upper right")

fig.savefig("figures/syscall_archs.pdf", format='pdf', dpi=600, bbox_inches='tight')

