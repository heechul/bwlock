obj-m = bwlockmod.o

KVERSION = $(shell uname -r)
BLDDIR= /lib/modules/$(KVERSION)/build

all: bench
	make -C $(BLDDIR) M=$(PWD) modules

clean:
	make -C $(BLDDIR) M=$(PWD) clean
	rm bwlocktest bwlockset hrt-bwlock
	rm *~

bench: bwlocktest bwlockset hrt-bwlock

bwlocktest: bwlocktest.c
	$(CC) -std=gnu99 -O2 -g $^ -o $@ -lrt

bwlockset: bwlockset.c
	$(CC) -std=gnu99 -O2 -g $^ -o $@ -lrt

hrt-bwlock: hrt-bwlock.c
	$(CC) -std=gnu99 -O2 $^ -o $@ -lrt

