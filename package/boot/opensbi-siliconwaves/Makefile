#
# Copyright (C) 2020 Tobias Maedel <openwrt@tbspace.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=opensbi-siliconwaves
PKG_VERSION:=1.2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/riscv-software-src/opensbi
PKG_SOURCE_VERSION:= 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
PKG_MIRROR_HASH:=31110bd87d417aeebf3dd6860bee32d387b6f22fed7a4815b078683ee8df460b
MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/opensbi-siliconwaves
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=RISC-V OpenSBI For SiliconWaves
    DEPENDS:=@TARGET_siliconwaves
endef

#define Build/Prepare
#endef

define Build/Compile
	+$(MAKE) -C $(PKG_BUILD_DIR) CROSS_COMPILE=$(TARGET_CROSS) \
		PLATFORM=generic  INSTALL_LIB_PATH=lib FW_PIC=n
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/build/platform/generic/firmware/fw_payload.bin  \
	       $(STAGING_DIR_IMAGE)/

endef

define Package/opensbi-siliconwaves/install
endef

$(eval $(call BuildPackage,opensbi-siliconwaves))
