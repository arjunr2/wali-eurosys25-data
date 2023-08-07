import os
import pandas as pd


def _read(path, name):
    with open(os.path.join(path, name)) as f:
        data = [float(x) for x in f.read().rstrip('\n').split(",")]
    return {
        "wall": data[0], "utime": data[1], "stime": data[2], "maxrss": data[3],
        "benchmark": name.split(".")[0], "mode": name.split(".")[1]
    }


def _summarize(benchmark):
    print(benchmark)
    pd.DataFrame(
        [_read(benchmark, p) for p in os.listdir(benchmark)]
    ).to_csv(benchmark + ".csv", index=False)


for benchmark in os.listdir("results"):
    if os.path.isdir(os.path.join("results", benchmark)):
        _summarize(os.path.join("results", benchmark))
