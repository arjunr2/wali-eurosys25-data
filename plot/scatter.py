#!/usr/bin/env python
# coding: utf-8

import pandas as pd
from matplotlib import pyplot as plt
from scipy.stats import linregress
import numpy as np
import os

def read_data(*args):
    dfs = [pd.read_csv(os.path.join("results", a + ".csv")) for a in args]
    res = pd.concat(dfs)
    res["benchmark"] = res["benchmark"].astype(str)
    return res


def _get(df, mode, key=None):
    res = df[df["mode"] == mode].sort_values('benchmark')
    if key is not None:
        res = np.array(res[key])
    return res


## Memory Plot
df = read_data("lua", "bash", "sqlite3")

modes = {
    "wali": "WALI",
    "qemu": "QEMU",
}

fig, axs = plt.subplots(1, 1, figsize=(3.2, 3))

x = _get(df, "native", "maxrss")

axs.scatter(
    x / 1000, _get(df, 'wali', "maxrss") / 1000, marker='.', label='WALI')

y = _get(df, "docker", "maxrss") + _get(df, "docker-inner", "maxrss")
axs.scatter(x / 1000, y / 1000, marker='+', label="Docker")

axs.scatter(
    x / 1000, _get(df, 'qemu', "maxrss") / 1000, marker='x', label='QEMU')


axs.legend()
axs.set_xlim(0, 20)
axs.set_ylim(10, 45)
axs.set_xlabel("Native Memory Usage (MB)")
axs.set_ylabel("Peak Memory Usage (MB)")
axs.grid()
fig.tight_layout()
fig.savefig("figures/memory.pdf")
##


## Runtime Plots
modes = {
    "wali": "WALI",
    # "docker-inner": "Docker -Launch",
    "docker": "Docker",
    "qemu": "QEMU"
}

def lrscatter(ax, df, xlim=None, ylim=None, limit=5):
    def _scatterlr(ax, x, y, marker='.', label=''):
        filter = (np.array(x) < 4) & (np.array(y) < 4)
        lr = linregress(x[filter], y[filter])
        ax.scatter(x, y, marker=marker, label=label)
        ax.plot([0, 4], [lr.intercept, lr.intercept + 4 * lr.slope])
        #print(label, lr.intercept, lr.slope)

    x = _get(df, "native", "wall")
    markers = ['.', '+', 'x', '1']
    for (name, label), marker in zip(modes.items(), markers):
        _scatterlr(ax, x, _get(df, name, "wall"), marker=marker, label=label)

    ax.grid()
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.plot(
        [-100, 100], [-100, 100], linestyle='--', color='gray', label='Native')


def _sharey(axs):
    for ax in axs[1:]:
        for tick in ax.yaxis.get_major_ticks():
            tick.tick1line.set_visible(False)
            tick.tick2line.set_visible(False)
            tick.label1.set_visible(False)
            tick.label2.set_visible(False)


fig, ax = plt.subplots(1, 1, figsize=(3.2, 3))
lrscatter(ax, read_data("lua"), limit=4, xlim=(-0.1, 1.8), ylim=(-0.1, 4))
ax.set_ylabel("Execution Time (s)")
ax.set_xlabel("Native Execution Time (s)")
ax.legend()
fig.tight_layout()
fig.savefig("figures/runtime_a.pdf")

fig, ax = plt.subplots(1, 1, figsize=(3.2, 3))
lrscatter(ax, read_data("bash"), limit=4, xlim=(-0.1, 1.5), ylim=(-0.1, 4))
ax.set_ylabel("Execution Time (s)")
ax.set_xlabel("Native Execution Time (s)")
fig.tight_layout()
fig.savefig("figures/runtime_b.pdf")

fig, ax = plt.subplots(1, 1, figsize=(3.2, 3))
lrscatter(ax, read_data("sqlite3"), limit=4, xlim=(-0.1, 1.0), ylim=(-0.1, 4))
ax.set_ylabel("Execution Time (s)")
ax.set_xlabel("Native Execution Time (s)")
fig.tight_layout()
fig.savefig("figures/runtime_c.pdf")
##
