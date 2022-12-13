MY_PACKAGE_VERSION = 1.0
MY_PACKAGE_SITE_METHOD = local
MY_PACKAGE_SITE = $(TOPDIR)/package/my-package/src

define HOST_MY_PACKAGE_BUILD_CMDS
	cd $(@D) \
	&& $(HOSTCC) $(@D)/my-code.c
endef

define HOST_MY_PACKAGE_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/a.out $(HOST_DIR)/bin/my-package
	$(HOST_DIR)/bin/my-package
endef

$(eval $(host-generic-package))
