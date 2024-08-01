include $(TOPDIR)/rules.mk

PKG_NAME:=hv-tools
PKG_VERSION:=2024.08.01
PKG_RELEASE:=r1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NikulovE/hv-tools/
PKG_SOURCE_DATE:=$(subst(.,-,$(PKG_VERSION)))
PKG_SOURCE_RELEASE:=$(subst(r,,$(PKG_RELEASE)))
PKG_SOURCE_VERSION:=489c57efd46983e688579974a2ab7aeaa7df8d83

PKG_MAINTAINER:=Evgeniy Nikulov <nikulov@live.ru>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

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
  $(INSTALL_DIR) $(1)/usr/sbin
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/sbin/hv_fcopy_daemon $(1)/usr/sbin/
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/sbin/hv_kvp_daemon $(1)/usr/sbin/
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/sbin/hv_vss_daemon $(1)/usr/sbin/

  $(INSTALL_DIR) $(1)/etc/init.d
  $(INSTALL_BIN) ./files/etc/init.d/hv_fcopy_daemon $(1)/etc/init.d/hv_fcopy_daemon
  $(INSTALL_BIN) ./files/etc/init.d/hv_kvp_daemon $(1)/etc/init.d/hv_kvp_daemon
  $(INSTALL_BIN) ./files/etc/init.d/hv_vss_daemon $(1)/etc/init.d/hv_vss_daemon
  
  $(INSTALL_DIR) $(1)/usr/bin
  $(INSTALL_BIN) ./files/usr/bin/hv_get_dhcp_info.sh $(1)/usr/bin/
  $(INSTALL_BIN) ./files/usr/bin/hv_get_dns_info.sh $(1)/usr/bin/
endef

$(eval $(call BuildPackage,hv-tools))