#
# Copyright (C) 2020 Tobias Maedel <openwrt@tbspace.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=opensbi-siliconwaves-w3k
PKG_VERSION:=1.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/adaptrum-richard/opensbi
PKG_SOURCE_VERSION:= b402f5f8335e459049508a7895756499028c294a
PKG_MIRROR_HASH:=ede18eb7266ccf8d4b65335cb11083ba009341a7a6fc7ac2c07bf1ff98543b17
MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/opensbi-siliconwaves-w3k
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=RISC-V OpenSBI For SiliconWaves w3k Soc
    DEPENDS:=@TARGET_siliconwaves_w3k
endef

#define Build/Prepare
#endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CROSS_COMPILE=$(TARGET_CROSS)  \
		PLATFORM=generic  INSTALL_LIB_PATH=lib FW_PIC=n
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/build/platform/generic/firmware/fw_payload.bin  \
	       $(STAGING_DIR_IMAGE)/

endef

define Package/opensbi-siliconwaves-w3k/install
endef

$(eval $(call BuildPackage,opensbi-siliconwaves-w3k))
