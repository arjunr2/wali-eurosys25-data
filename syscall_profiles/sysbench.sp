% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 38.39    0.000880           4       196           mmap
 26.88    0.000616           9        62           mprotect
 10.12    0.000232           5        43           openat
  6.89    0.000158           3        43         1 read
  6.15    0.000141           3        44           fstat
  5.02    0.000115           2        43           close
  1.05    0.000024           8         3           futex
  1.00    0.000023          11         2           write
  1.00    0.000023           5         4           brk
  0.92    0.000021          21         1           munmap
  0.48    0.000011           5         2           rt_sigaction
  0.35    0.000008           8         1         1 stat
  0.31    0.000007           7         1           ioctl
  0.31    0.000007           7         1           getrandom
  0.26    0.000006           3         2         1 arch_prctl
  0.26    0.000006           6         1           prlimit64
  0.22    0.000005           5         1           rt_sigprocmask
  0.22    0.000005           5         1           set_robust_list
  0.17    0.000004           4         1           set_tid_address
  0.00    0.000000           0         8           pread64
  0.00    0.000000           0         1         1 access
  0.00    0.000000           0         1           execve
------ ----------- ----------- --------- --------- ----------------
100.00    0.002292                   462         4 total
