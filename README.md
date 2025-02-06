# WALI Data for Artifact Evaluation

Tested to work on Ubuntu 22.04. The repo is organized as follows

```shell
data.tar.gz             // All data to generate figures
	- results           // WALI-docker-qemu comparison
	- sigresults        // Sigpoll benchmarks
	- syscall_profile   // `strace -c` outputs for syscall
	- microbenchmarks   // Intrinsic overheads of WALI
	- macrobenchmarks   // Overhead split on macrobenchmarks

benchmarks.tar.gz       // Benchmarks compiled to generate data
...
plot/                   // All the plotting scripts for figures, based on data
figures/                // All the figures generated from 'plot' scripts
```


## Getting started

### Pre-packaged Data

All data used for the paper is already pre-packaged in the above `.tar.gz` files. 
The figures are also already generated in `figures`. 
To re-generate figures:

1. Untar `data.tar.gz`
2. Run `./gen_plots.sh`

### Rerun Benchmarks

Note, the new runs may differ quite drastically from collected ones based on hardware platform or effects of OS virtualization in the stack.
However the trends will remain the same --- WALI is a middle-ground between fast startup time of QEMU and fast runtime of Docker.
After running these steps, you can generate figures as in the previous section.

To rerun, first perform these prerequisites:

1. Untar `benchmarks.tar.gz` and `virt.tar.gz` (available in the artifact VM, not on Github)
2. (Optional) Build AoT files with `./build_aot.sh` -- these are already packaged in the benchmarks directory.


#### WALI-Docker-QEMU Comparison Benchmarks

Follow these steps:
1. Generate dataset for `sqlite3`:
```shell
cd benchmarks/sqlite3; 
python3 create.py; 
cd ../..
```
2. Now make docker images with: `sudo make docker`
3. Generate `results` directory with `./benchmark.sh` (approx 20 min to run)
4. Summarize the directory with `python3 summarize.py`

#### Sigpoll benchmarks

Run `./sigtest.sh` (10-20 min to run) to generate the `sigresults`

