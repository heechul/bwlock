BWLOCK: memory bandwidth control API 

Heechul Yun <heechul.yun@ku.edu>


Preparation
===========

Patch the kernel (v3.6) as follows. 

```
   $ patch -p1 < bwlock-3.6.patch 
```

Configure the kernel to enable BWLOCK.

```
   CONFIG_BWLOCK=y
```

Install & boot the BWLOCK enabled kernel. 

Build & install the bwlock kernel module
```
   $ make 
   $ sudo insmod bwlockmod.ko 

```

Usage
==========

## coarse grain locking 

If you do the following, the <pid> process will be bw locked whenever 
it is scheduled by the scheduler. 

```
  ./bwlockset <pid> <bwlock_value>

Example)
  $ ./bwlockset `pidof X` 1
  set pid=2559 val=1
```

## fine-grain locking

To support fine-grain bw locking, you need to modify the program to use 
bw_lock()/bw_unlock(). 

```
  #include "bwlock.h"
  
  bw_lock()
  ...
  bw_unlock()
```

Publication
=============

Heechul Yun, Santosh Gondi, Siddhartha Biswas. "Protecting Memory-Performance Critical Sections in Soft Real-Time Applications," In submission. [(pdf)](http://www.ittc.ku.edu/~heechul/papers/bwlock-submitted.pdf)



