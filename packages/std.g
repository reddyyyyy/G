macro NULL 0 end

macro nop end

macro true 0 0 = end
macro false 0 0 != end

macro stdin  0 end
macro stdout 1 end
macro stderr 2 end

macro SYS_write 1 end
macro SYS_open 2 end
macro SYS_close 3 end
macro SYS_stat 4 end
macro SYS_fstat 5 end
macro SYS_lstat 6 end
macro SYS_poll 7 end
macro SYS_lseek 8 end
macro SYS_mmap 9 end
macro SYS_mprotect 10 end
macro SYS_munmap 11 end
macro SYS_brk 12 end
macro SYS_rt_sigaction 13 end
macro SYS_rt_sigprocmask 14 end
macro SYS_rt_sigreturn 15 end
macro SYS_ioctl 16 end
macro SYS_pread64 17 end
macro SYS_pwrite64 18 end
macro SYS_readv 19 end
macro SYS_writev 20 end
macro SYS_access 21 end
macro SYS_pipe 22 end
macro SYS_select 23 end
macro SYS_sched_yield 24 end
macro SYS_mremap 25 end
macro SYS_msync 26 end
macro SYS_mincore 27 end
macro SYS_madvise 28 end
macro SYS_shmget 29 end
macro SYS_shmat 30 end
macro SYS_shmctl 31 end
macro SYS_dup 32 end
macro SYS_dup2 33 end
macro SYS_pause 34 end
macro SYS_nanosleep 35 end
macro SYS_getitimer 36 end
macro SYS_alarm 37 end
macro SYS_setitimer 38 end
macro SYS_getpid 39 end
macro SYS_sendfile 40 end
macro SYS_socket 41 end
macro SYS_connect 42 end
macro SYS_accept 43 end
macro SYS_sendto 44 end
macro SYS_recvfrom 45 end
macro SYS_sendmsg 46 end
macro SYS_recvmsg 47 end
macro SYS_shutdown 48 end
macro SYS_bind 49 end
macro SYS_listen 50 end
macro SYS_getsockname 51 end
macro SYS_getpeername 52 end
macro SYS_socketpair 53 end
macro SYS_setsockopt 54 end
macro SYS_getsockopt 55 end
macro SYS_clone 56 end
macro SYS_fork 57 end
macro SYS_vfork 58 end
macro SYS_execve 59 end
macro SYS_exit 60 end
macro SYS_wait4 61 end
macro SYS_kill 62 end
macro SYS_uname 63 end
macro SYS_semget 64 end
macro SYS_semop 65 end
macro SYS_semctl 66 end
macro SYS_shmdt 67 end
macro SYS_msgget 68 end
macro SYS_msgsnd 69 end
macro SYS_msgrcv 70 end
macro SYS_msgctl 71 end
macro SYS_fcntl 72 end
macro SYS_flock 73 end
macro SYS_fsync 74 end
macro SYS_fdatasync 75 end
macro SYS_truncate 76 end
macro SYS_ftruncate 77 end
macro SYS_getdents 78 end
macro SYS_getcwd 79 end
macro SYS_chdir 80 end
macro SYS_fchdir 81 end
macro SYS_rename 82 end
macro SYS_mkdir 83 end
macro SYS_rmdir 84 end
macro SYS_creat 85 end
macro SYS_link 86 end
macro SYS_unlink 87 end
macro SYS_symlink 88 end
macro SYS_readlink 89 end
macro SYS_chmod 90 end
macro SYS_fchmod 91 end
macro SYS_chown 92 end
macro SYS_fchown 93 end
macro SYS_lchown 94 end
macro SYS_umask 95 end
macro SYS_gettimeofday 96 end
macro SYS_getrlimit 97 end
macro SYS_getrusage 98 end
macro SYS_sysinfo 99 end
macro SYS_times 100 end
macro SYS_ptrace 101 end
macro SYS_getuid 102 end
macro SYS_syslog 103 end
macro SYS_getgid 104 end
macro SYS_setuid 105 end
macro SYS_setgid 106 end
macro SYS_geteuid 107 end
macro SYS_getegid 108 end
macro SYS_setpgid 109 end
macro SYS_getppid 110 end
macro SYS_getpgrp 111 end
macro SYS_setsid 112 end
macro SYS_setreuid 113 end
macro SYS_setregid 114 end
macro SYS_getgroups 115 end
macro SYS_setgroups 116 end
macro SYS_setresuid 117 end
macro SYS_getresuid 118 end
macro SYS_setresgid 119 end
macro SYS_getresgid 120 end
macro SYS_getpgid 121 end
macro SYS_setfsuid 122 end
macro SYS_setfsgid 123 end
macro SYS_getsid 124 end
macro SYS_capget 125 end
macro SYS_capset 126 end
macro SYS_rt_sigpending 127 end
macro SYS_rt_sigtimedwait 128 end
macro SYS_rt_sigqueueinfo 129 end
macro SYS_rt_sigsuspend 130 end
macro SYS_sigaltstack 131 end
macro SYS_utime 132 end
macro SYS_mknod 133 end
macro SYS_uselib 134 end
macro SYS_personality 135 end
macro SYS_ustat 136 end
macro SYS_statfs 137 end
macro SYS_fstatfs 138 end
macro SYS_sysfs 139 end
macro SYS_getpriority 140 end
macro SYS_setpriority 141 end
macro SYS_sched_setparam 142 end
macro SYS_sched_getparam 143 end
macro SYS_sched_setscheduler 144 end
macro SYS_sched_getscheduler 145 end
macro SYS_sched_get_priority_max 146 end
macro SYS_sched_get_priority_min 147 end
macro SYS_sched_rr_get_interval 148 end
macro SYS_mlock 149 end
macro SYS_munlock 150 end
macro SYS_mlockall 151 end
macro SYS_munlockall 152 end
macro SYS_vhangup 153 end
macro SYS_modify_ldt 154 end
macro SYS_pivot_root 155 end
macro SYS__sysctl 156 end
macro SYS_prctl 157 end
macro SYS_arch_prctl 158 end
macro SYS_adjtimex 159 end
macro SYS_setrlimit 160 end
macro SYS_chroot 161 end
macro SYS_sync 162 end
macro SYS_acct 163 end
macro SYS_settimeofday 164 end
macro SYS_mount 165 end
macro SYS_umount2 166 end
macro SYS_swapon 167 end
macro SYS_swapoff 168 end
macro SYS_reboot 169 end
macro SYS_sethostname 170 end
macro SYS_setdomainname 171 end
macro SYS_iopl 172 end
macro SYS_ioperm 173 end
macro SYS_create_module 174 end
macro SYS_init_module 175 end
macro SYS_delete_module 176 end
macro SYS_get_kernel_syms 177 end
macro SYS_query_module 178 end
macro SYS_quotactl 179 end
macro SYS_nfsservctl 180 end
macro SYS_getpmsg 181 end
macro SYS_putpmsg 182 end
macro SYS_afs_syscall 183 end
macro SYS_tuxcall 184 end
macro SYS_security 185 end
macro SYS_gettid 186 end
macro SYS_readahead 187 end
macro SYS_setxattr 188 end
macro SYS_lsetxattr 189 end
macro SYS_fsetxattr 190 end
macro SYS_getxattr 191 end
macro SYS_lgetxattr 192 end
macro SYS_fgetxattr 193 end
macro SYS_listxattr 194 end
macro SYS_llistxattr 195 end
macro SYS_flistxattr 196 end
macro SYS_removexattr 197 end
macro SYS_lremovexattr 198 end
macro SYS_fremovexattr 199 end
macro SYS_tkill 200 end
macro SYS_time 201 end
macro SYS_futex 202 end
macro SYS_sched_setaffinity 203 end
macro SYS_sched_getaffinity 204 end
macro SYS_set_thread_area 205 end
macro SYS_io_setup 206 end
macro SYS_io_destroy 207 end
macro SYS_io_getevents 208 end
macro SYS_io_submit 209 end
macro SYS_io_cancel 210 end
macro SYS_get_thread_area 211 end
macro SYS_lookup_dcookie 212 end
macro SYS_epoll_create 213 end
macro SYS_epoll_ctl_old 214 end
macro SYS_epoll_wait_old 215 end
macro SYS_remap_file_pages 216 end
macro SYS_getdents64 217 end
macro SYS_set_tid_address 218 end
macro SYS_restart_syscall 219 end
macro SYS_semtimedop 220 end
macro SYS_fadvise64 221 end
macro SYS_timer_create 222 end
macro SYS_timer_settime 223 end
macro SYS_timer_gettime 224 end
macro SYS_timer_getoverrun 225 end
macro SYS_timer_delete 226 end
macro SYS_clock_settime 227 end
macro SYS_clock_gettime 228 end
macro SYS_clock_getres 229 end
macro SYS_clock_nanosleep 230 end
macro SYS_exit_group 231 end
macro SYS_epoll_wait 232 end
macro SYS_epoll_ctl 233 end
macro SYS_tgkill 234 end
macro SYS_utimes 235 end
macro SYS_vserver 236 end
macro SYS_mbind 237 end
macro SYS_set_mempolicy 238 end
macro SYS_get_mempolicy 239 end
macro SYS_mq_open 240 end
macro SYS_mq_unlink 241 end
macro SYS_mq_timedsend 242 end
macro SYS_mq_timedreceive 243 end
macro SYS_mq_notify 244 end
macro SYS_mq_getsetattr 245 end
macro SYS_kexec_load 246 end
macro SYS_waitid 247 end
macro SYS_add_key 248 end
macro SYS_request_key 249 end
macro SYS_keyctl 250 end
macro SYS_ioprio_set 251 end
macro SYS_ioprio_get 252 end
macro SYS_inotify_init 253 end
macro SYS_inotify_add_watch 254 end
macro SYS_inotify_rm_watch 255 end
macro SYS_migrate_pages 256 end
macro SYS_openat 257 end
macro SYS_mkdirat 258 end
macro SYS_mknodat 259 end
macro SYS_fchownat 260 end
macro SYS_futimesat 261 end
macro SYS_newfstatat 262 end
macro SYS_unlinkat 263 end
macro SYS_renameat 264 end
macro SYS_linkat 265 end
macro SYS_symlinkat 266 end
macro SYS_readlinkat 267 end
macro SYS_fchmodat 268 end
macro SYS_faccessat 269 end
macro SYS_pselect6 270 end
macro SYS_ppoll 271 end
macro SYS_unshare 272 end
macro SYS_set_robust_list 273 end
macro SYS_get_robust_list 274 end
macro SYS_splice 275 end
macro SYS_tee 276 end
macro SYS_sync_file_range 277 end
macro SYS_vmsplice 278 end
macro SYS_move_pages 279 end
macro SYS_utimensat 280 end
macro SYS_epoll_pwait 281 end
macro SYS_signalfd 282 end
macro SYS_timerfd_create 283 end
macro SYS_eventfd 284 end
macro SYS_fallocate 285 end
macro SYS_timerfd_settime 286 end
macro SYS_timerfd_gettime 287 end
macro SYS_accept4 288 end
macro SYS_signalfd4 289 end
macro SYS_eventfd2 290 end
macro SYS_epoll_create1 291 end
macro SYS_dup3 292 end
macro SYS_pipe2 293 end
macro SYS_inotify_init1 294 end
macro SYS_preadv 295 end
macro SYS_pwritev 296 end
macro SYS_rt_tgsigqueueinfo 297 end
macro SYS_perf_event_open 298 end
macro SYS_recvmmsg 299 end
macro SYS_fanotify_init 300 end
macro SYS_fanotify_mark 301 end
macro SYS_prlimit64 302 end
macro SYS_name_to_handle_at 303 end
macro SYS_open_by_handle_at 304 end
macro SYS_clock_adjtime 305 end
macro SYS_syncfs 306 end
macro SYS_sendmmsg 307 end
macro SYS_setns 308 end
macro SYS_getcpu 309 end
macro SYS_process_vm_readv 310 end
macro SYS_process_vm_writev 311 end
macro SYS_kcmp 312 end
macro SYS_finit_module 313 end

macro SYS_read 0 end

macro AT_FDCWD -100 end

macro O_RDONLY 0 end

macro CLOCK_MONOTONIC 1 end
macro TIMER_ABSTIME 1 end

macro write SYS_write syscall3 end
macro read SYS_read syscall3 end
macro openat SYS_openat syscall3 end
macro close SYS_close syscall1 end
macro exit SYS_exit syscall1 drop end
macro clock_nanosleep SYS_clock_nanosleep syscall4 end

macro 2dup over over end
macro 2drop drop drop end

macro / divmod drop end
macro % divmod swap drop end
macro mod % end
macro div / end

macro nth_argv
  8 * argv + ,64 cast(ptr)
end

macro inc64
  dup ,64 1 + .64
end

macro dec64
  dup ,64 1 - .64
end

macro cstrlen
  dup
  while dup , 0 != do 1 + end
  swap -
end

macro cstreq
  while
    if over , 0 != over , 0 != and do
       over , over , =
    else
       false
    end
  do
    1 + swap 1 +
  end
  , 0 =
  swap , 0 =
  and
end

macro cstr-to-pstr
  dup cstrlen swap
end

macro fputs
  write drop
end

macro puts
  stdout fputs
end

macro eputs
  stderr fputs
end
