#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_VERSION:=2022.10
PKG_RELEASE:=$(AUTORELEASE)
PKG_HASH:=50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8
OPENSBI:=$(STAGING_DIR_IMAGE)/fw_payload.bin

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=siliconwaves
  BUILD_SUBTARGET:=generic
  UBOOT_IMAGE:=u-boot.itb spl/u-boot-spl.bin
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
