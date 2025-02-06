# WALI Data for Artifact Evaluation

Tested to work on Ubuntu 22.04. The repo is organized as follows

```shell
data.tar.gz				// All data to generate figures
	- results			// WALI-docker-qemu comparison
	- sigresults		// Sigpoll benchmarks
	- syscall_profile   // `strace -c` outputs for syscall
	- microbenchmarks	// Intrinsic overheads of WALI
	- macrobenchmarks	// Overhead split on macrobenchmarks

benchmarks.tar.gz		// Benchmarks compiled to generate data
wamr.tar.gz				// Iwasm/AoT Compiler used to generate data
...
plot/					// All the plotting scripts for figures, based on data
figures/				// All the figures generated from 'plot' scripts
```


## Getting started

### Pre-packaged Data

All data used for the paper is already pre-packaged in the above `.tar.gz` files. 
The figures are also already generated in `figures`. 
To re-generate figures:

1. Untar `data.tar.gz`
2. Run `./gen_plots.sh`

### Reproducing Runs

Note, the new runs may differ quite drastically from collected ones based on hardware platform or effects of OS virtualization in the stack.
To rerun, first perform these prerequisites:

1. Untar `benchmarks.tar.gz`
2. (Optional) Build AoT files with `./build_aot.sh` -- these are already packaged in the benchmarks directory.
3. Root access for docker run: `sudo su`


#### WALI-Docker-QEMU Comparison Benchmarks

Follow these steps:
1. Generate dataset for `sqlite3: `cd benchmarks/sqlite3; python3 create.py; cd ../..`.
2. Now make docker images with: `make docker`
3. Finally, generate `results` directory with `./benchmark.sh` (approx 10 min to run)

#### Sigpoll benchmarks

Follow these steps:
1. Run `make sigtest` (approx 5 min to run)

#### Syscall Profile

This 
