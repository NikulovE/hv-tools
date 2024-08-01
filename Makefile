include $(TOPDIR)/rules.mk

PKG_NAME:=hv-tools
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Evgeniy Nikulov <nikulov@live.ru>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/hv-tools
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Hyper-V Guest Tools
  DEPENDS:=+procd
endef

define Package/hv-tools/description
  This package contains Hyper-V Guest Tools for OpenWrt, including various utilities and daemons.
endef

define Build/Compile
endef

define Package/hv-tools/install
  $(INSTALL_DIR) $(1)/etc/rc.d
  $(INSTALL_BIN) $(SOURCE_DIR)/files/etc/rc.d/S60hv_fcopy_daemon $(1)/etc/rc.d/
  $(INSTALL_BIN) $(SOURCE_DIR)/files/etc/rc.d/S60hv_kvp_daemon $(1)/etc/rc.d/
  $(INSTALL_BIN) $(SOURCE_DIR)/files/etc/rc.d/S60hv_vss_daemon $(1)/etc/rc.d/
  
  $(INSTALL_DIR) $(1)/usr/sbin
  $(INSTALL_BIN) $(SOURCE_DIR)/files/usr/sbin/hv_fcopy_daemon $(1)/usr/sbin/
  $(INSTALL_BIN) $(SOURCE_DIR)/files/usr/sbin/hv_kvp_daemon $(1)/usr/sbin/
  $(INSTALL_BIN) $(SOURCE_DIR)/files/usr/sbin/hv_vss_daemon $(1)/usr/sbin/

  $(INSTALL_DIR) $(1)/usr/bin
  $(INSTALL_BIN) $(SOURCE_DIR)/files/usr/bin/hv_get_dhcp_info.sh $(1)/usr/bin/
  $(INSTALL_BIN) $(SOURCE_DIR)/files/usr/bin/hv_get_dns_info.sh $(1)/usr/bin/
endef

$(eval $(call BuildPackage,hv-tools))
