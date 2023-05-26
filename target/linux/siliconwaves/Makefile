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
FEATURES:=boot-part ext4 rootfs-part rtc gpio usb

KERNEL_PATCHVER:=5.15

define Target/Description
        Build firmware image for SilionWaves fu740 SoC devices.
        Currently produces SD Card image for siliconwaves test.
endef

KERNELNAME:= Image dtbs
include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += mkf2fs e2fsprogs blkid kmod-igb perf \
		    kmod-libphy kmod-e1000e kmod-e1000 kmod-macb

$(eval $(call BuildTarget))
