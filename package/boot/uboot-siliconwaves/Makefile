#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_VERSION:=2023.01
PKG_RELEASE:=$(AUTORELEASE)
PKG_HASH:=69423bad380f89a0916636e89e6dcbd2e4512d584308d922d1039d1e4331950f

OPENSBI:=$(STAGING_DIR_IMAGE)/opensbi/fw_payload.bin

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=siliconwaves
  BUILD_SUBTARGET:=generic
  UBOOT_IMAGE:=u-boot.img
endef

define U-Boot/sifive_unmatched
  NAME:=unmatched
  BUILD_SUBTARGET:=fu740
  BUILD_DEVICES:=hifive-unmatched-a00
  DEPENDS:= +opensbi-siliconwaves
endef

UBOOT_TARGETS:=sifive_unmatched

define Build/InstallDev
	$(foreach device,$(BUILD_DEVICES), \
		$(INSTALL_DIR) $(STAGING_DIR_IMAGE)/$(device)
	)
	$(foreach device,$(BUILD_DEVICES), \
		$(CP) $(patsubst %,$(PKG_BUILD_DIR)/%,$(UBOOT_IMAGE)) $(STAGING_DIR_IMAGE)/$(device)/
	)
endef

$(eval $(call BuildPackage/U-Boot))
