#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk


PKG_VERSION:=1.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:adaptrum/sw-u-boot.git
PKG_SOURCE_VERSION:=29860d410a6806c0176433adc2f73fef3926d630
PKG_MIRROR_HASH:=419b3465515b904850349eb699b9173419a3f9dea19323c29710409d47826d49

OPENSBI:=$(STAGING_DIR_IMAGE)/fw_dynamic.bin

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=siliconwaves
  BUILD_SUBTARGET:=generic
  UBOOT_IMAGE:=u-boot.itb spl/u-boot-spl.bin
endef

define U-Boot/siliconwaves_vu13p
  NAME:=vu13p
  BUILD_SUBTARGET:=w3k
  BUILD_DEVICES:=siliconwaves-vu13p
  DEPENDS:= +opensbi-siliconwaves-w3k
endef

UBOOT_TARGETS:=siliconwaves_vu13p

define Build/InstallDev
	$(foreach device,$(BUILD_DEVICES), \
		$(INSTALL_DIR) $(STAGING_DIR_IMAGE)/$(device)
	)
	$(foreach device,$(BUILD_DEVICES), \
		$(CP) $(patsubst %,$(PKG_BUILD_DIR)/%,$(UBOOT_IMAGE)) $(STAGING_DIR_IMAGE)/$(device)/
	)
endef

$(eval $(call BuildPackage/U-Boot))
