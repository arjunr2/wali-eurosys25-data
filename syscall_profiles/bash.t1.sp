% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 62.61    0.056449        5644        10         4 wait4
 12.55    0.011318           8      1390           read
  7.92    0.007143           5      1208        51 openat
  5.93    0.005345           4      1190         4 close
  4.43    0.003992          37       107         1 write
  3.92    0.003533           5       669        81 stat
  0.62    0.000556         139         4           getdents64
  0.39    0.000352          58         6           clone
  0.19    0.000167           3        50           brk
  0.18    0.000161           3        49           rt_sigprocmask
  0.16    0.000146           1       101           fstat
  0.16    0.000140           0       181           mmap
  0.15    0.000137          19         7           execve
  0.11    0.000097           3        28         1 lseek
  0.08    0.000073           0        89           rt_sigaction
  0.06    0.000052           4        12           munmap
  0.06    0.000051           2        22         8 access
  0.05    0.000047           4        10           getpid
  0.04    0.000037           2        16           getegid
  0.04    0.000036           2        17           geteuid
  0.04    0.000035           2        16           getuid
  0.04    0.000035           2        16           getgid
  0.04    0.000034           0        46           pread64
  0.03    0.000031          15         2           mremap
  0.03    0.000029           0        50           mprotect
  0.03    0.000026           1        14         7 ioctl
  0.02    0.000019           9         2           pipe
  0.02    0.000019           9         2           sysinfo
  0.02    0.000016           4         4           rt_sigreturn
  0.02    0.000016           2         6         6 connect
  0.02    0.000016           3         5         1 fcntl
  0.02    0.000015           2         6           socket
  0.01    0.000010           2         4           getppid
  0.01    0.000009           0        14         7 arch_prctl
  0.01    0.000007           1         4           prlimit64
  0.01    0.000005           0         9           dup2
  0.01    0.000005           2         2           futex
  0.00    0.000004           4         1           uname
  0.00    0.000003           1         2           getpgrp
  0.00    0.000000           0        10           lstat
  0.00    0.000000           0         2           getgroups
  0.00    0.000000           0         1           sigaltstack
  0.00    0.000000           0         2         2 statfs
  0.00    0.000000           0        19        19 getxattr
  0.00    0.000000           0        10        10 lgetxattr
  0.00    0.000000           0         2           set_tid_address
  0.00    0.000000           0         1           fadvise64
  0.00    0.000000           0         2           set_robust_list
------ ----------- ----------- --------- --------- ----------------
100.00    0.090166                  5420       202 total
