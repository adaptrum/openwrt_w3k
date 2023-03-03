#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

FAT32_BLOCK_SIZE=1024
FAT32_BLOCKS=$(shell echo $$(($(CONFIG_TARGET_KERNEL_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Build/Compile
        $(CP) $(LINUX_DIR)/COPYING $(KDIR)/COPYING.linux
endef

### Image scripts ###
define Build/boot-common
        rm -f $@.boot
        mkfs.fat -n boot -C $@.boot $(FAT32_BLOCKS)
        mcopy -i $@.boot extlinux ::
        mcopy -i $@.boot $(IMAGE_KERNEL) ::$(KERNEL_IMG)
        $(foreach dts,$(shell echo $(DEVICE_DTS)),mcopy -i $@.boot $(DTS_DIR)/$(dts).dtb ::;)
endef

define Build/sdcard-img-unmatched
        ./gen_siliconwaves_sdcard_img.sh $@ $@.boot $(IMAGE_ROOTFS) \
                $(CONFIG_TARGET_KERNEL_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE) \
		$(STAGING_DIR_IMAGE)/$(DEVICE_NAME)/u-boot.itb \
		$(STAGING_DIR_IMAGE)/$(DEVICE_NAME)/u-boot-spl.bin
endef

define Build/sdcard-img
        ./gen_generic_sdcard_img.sh $@ $@.boot $(IMAGE_ROOTFS) \
                $(CONFIG_TARGET_KERNEL_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE)
endef


### Devices ###
define Device/Default
  DEVICE_VENDOR := SiliconWaves
  KERNEL := kernel-bin | gzip
  KERNEL_IMG := kernel.img
  IMAGES := factory.img.gz sysupgrade.img.gz
  IMAGE/sysupgrade.img.gz := boot-common | sdcard-img | gzip | append-metadata
  IMAGE/factory.img.gz := boot-common |  sdcard-img | gzip
endef

define Device/hifive-unmatched-a00
  DEVICE_MODEL := unmatched
  DEVICE_VARIANT := (64bit)
  KERNEL_IMG := hifive-unmatched-a00-kernel.bin
  DEVICE_DTS := \
        sifive/hifive-unmatched-a00
  IMAGE/sysupgrade.img.gz := boot-common |  sdcard-img-unmatched | gzip | append-metadata
  IMAGE/factory.img.gz := boot-common |  sdcard-img-unmatched | gzip
endef
ifeq ($(SUBTARGET),fu740)
  TARGET_DEVICES += hifive-unmatched-a00
endif

$(eval $(call BuildImage))
