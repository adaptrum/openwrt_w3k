ARCH:=riscv64
SUBTARGET:=fu740
BOARDNAME:=FU740
CPU_TYPE:=riscv64
DEFAULT_PACKAGES += 
KERNELNAME:=Image dtbs

define Target/Description
	Build firmware images for sifive fu740  based boards.
endef

