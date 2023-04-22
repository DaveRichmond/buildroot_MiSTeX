MISTEX_VERSION = main
MISTEX_SITE = $(call github,DaveRichmond,Main_MiSTeX,$(MISTEX_VERSION))
MISTEX_INSTALL_STAGING = YES
MISTEX_DEPENDENCIES = host-python3 imlib2 libgpiod bluez5_utils

$(eval $(meson-package))
