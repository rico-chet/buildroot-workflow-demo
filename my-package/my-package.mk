MY_PACKAGE_VERSION = 1.0
MY_PACKAGE_SITE_METHOD = local
MY_PACKAGE_SITE = $(TOPDIR)/package/my-package/src

define MY_PACKAGE_BUILD_CMDS
	true
endef

$(eval $(host-generic-package))
