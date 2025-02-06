#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

sigdir = Path('sigresults')
btimes = {}
apps = ['bash', 'lua', 'sqlite3', 'paho-bench']

btimes_np = {}
for bdir in sigdir.iterdir():
    btimes[bdir.name] = {x.suffix[1:] : float(open(x).read().split(',')[0]) for x in bdir.iterdir()}
    if bdir.name not in btimes_np:
        btimes_np[bdir.name] = {}
    bt = btimes_np[bdir.name]
    for x in bdir.iterdir():
        tp = x.suffix[1:]
        if tp not in bt:
            bt[tp] = []
        bt[tp].append(open(x).read().split(',')[0])

for v in btimes_np.values():
    for k in v.keys():
        v[k] = np.array(v[k], dtype=float)

for v in btimes_np.values():
    for k in v.keys():
        if k != 'signone':
            v[k] = ((np.mean(v[k]/v['signone']))-1)*100


with open("figures/sigpoll.txt", 'w') as f:
	print ("{:<20} {:<10} {:<10} {:<10}".format("Application", "Loop", "Func", "All"), file=f)
	for app, v in btimes_np.items():
		np.set_printoptions(precision=2, suppress=True)
		print ("{:<20} {:<10} {:<10} {:<10}".format(app, round(v['sigloop'], 1),\
													round(v['sigfunc'], 1),\
													round(v['sigall'], 1)), file=f)

