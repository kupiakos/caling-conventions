
cconvs := cdecl fastcall stdcall
binaries := $(addprefix win32-,$(cconvs)) win64 linux-x86 linux-x64
asms = $(addsuffix .asm,$(binaries))

CC ?= gcc
CONV ?=
CFLAGS = -g $(CONV)

all: $(binaries) $(asms)

win32%: CC = i686-w64-mingw32-gcc
win64: CC = x86_64-w64-mingw32-gcc
win64: CONV = -DCCONV=
%-fastcall: CONV = -DCCONV=_fastcall
%-stdcall: CONV = -DCCONV=_stdcall
%-cdecl: CONV = -DCCONV=_cdecl 
%-x86: CFLAGS += -m32

$(binaries): main.c
	$(CC) -o $@ $^ $(CFLAGS)

# This is called a Static Pattern Rule
$(asms) : %.asm : %
	gdb -batch -ex 'file $<' \
	-ex 'disassemble /m main' \
	-ex 'disassemble /m foo' > $@

.PHONY: clean all
clean:
	-rm -r $(binaries)
	-rm -r $(asms)


