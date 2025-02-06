#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
import json

with open("macrobenchmarks/overheads.json") as f:
	overheads = json.load(f)

fig, ax = plt.subplots(1, figsize=(6, 1.8))

keys = list(overheads.keys())

app_arr = []
native_arr = []
wali_arr = []
exec_arr = []

for k, v in overheads.items():
    exec_arr.append(v["exec"])
    app_arr.append(v["exec"] - v["native"] - v["wali"])
    native_arr.append(v["native"])
    wali_arr.append(v["wali"])
    
exec_arr = np.array(exec_arr) / 1e9
app_arr = np.array(app_arr) / 1e9
native_arr = np.array(native_arr) / 1e9
wali_arr = np.array(wali_arr) / 1e9

tp = np.array(list(zip(app_arr, native_arr, wali_arr))) / np.expand_dims(exec_arr, axis=1)
tp *= 100

colors = ["C0", "orange", "green"]
labels = ["wasm-app", "kernel", "wali"]
bottoms = [0, 0, 0, 0, 0]
b = []
k = 0

fonts = [{'size':8, 'color':i, 'fontweight':'semibold'} for i in colors]
for bars, col, label in zip([app_arr/exec_arr, native_arr/exec_arr, wali_arr/exec_arr], colors, labels):
    b = ax.bar(keys, bars, bottom=bottoms, color=col, width=0.4, label=label)
    for i in range(len(app_arr)):
        ax.text(i+0.24, 0.2 + k*0.35, f"{round(tp[i][k],1)}%", \
            ha='left', fontdict=fonts[k])
    bottoms = [bottoms[i] + bars[i] for i in range(len(app_arr))]

    k += 1
    
#for i in range(len(app_arr)):
#    ax.text(i, bottoms[i] + 0.1, f"{round(tp[i][0],1), round(tp[i][1],1), round(tp[i][2],1)}", \
#            ha='center', fontdict=font1)
#    ax.text(i+0.3, bottoms[i] + 0.1, f"{round(tp[i][0],1), round(tp[i][1],1), round(tp[i][2],1)}", \
#            ha='left', fontdict=font1)

ax.set_ylim(top=1.5)
ax.yaxis.set_ticks([], labels=[])
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
#ax.xaxis.grid(linestyle='dashed')
ax.legend(loc="upper left", ncols=3, fontsize=9)
ax.set_ylabel("Norm Runtime")

fig.savefig("figures/wali_macrobench.pdf", dpi=600, bbox_inches='tight')
