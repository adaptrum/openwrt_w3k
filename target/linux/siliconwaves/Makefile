#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Copyright (c) 2015 OpenWrt.org
#
include $(TOPDIR)/rules.mk

ARCH:=riscv64
BOARD:=siliconwaves
BOARDNAME:=SiliconWaves risc-v
SUBTARGETS:=fu740 wave3000
CPU_TYPE:=riscv64
FEATURES:=dt-overlay emmc gpio pci pcie rootfs-part separate_ramdisk squashfs usb

KERNEL_PATCHVER:=5.15

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES +=

$(eval $(call BuildTarget))
