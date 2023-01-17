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
BOARDNAME:=SiliconWaves V1
SUBTARGETS:=fu740
CPU_TYPE:=u74
FEATURES:=boot-part ext4 rootfs-part squashfs rtc gpio usb

KERNEL_PATCHVER:=5.15
KERNELNAME:= Image.gz
include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += uboot-envtools mkf2fs e2fsprogs blkid

$(eval $(call BuildTarget))
