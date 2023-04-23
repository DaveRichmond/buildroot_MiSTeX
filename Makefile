export BR2_EXTERNAL ?= $(realpath overlay)
export BR2_GLOBAL_PATCH_DIR ?= $(realpath overlay)

define colourerror
	@tput setaf 1
	@echo $1
	@tput sgr0
endef

define colourinfo
	@tput setaf 2
	@echo $1
	@tput sgr0
endef

export DEV ?= /dev/sdb
export IMG ?= buildroot/output/images/sdcard.img
flash: $(IMG)
	$(call colourinfo,"Flashing image $(IMG) to $(DEV)")
ifeq ($(shell id -u), 0)
	dd if=$(IMG) of=$(DEV) bs=512k status=progress
else
	$(call colourerror,"Must be run as root!")
endif

.DEFAULT_GOAL := all

%:
	$(MAKE) -C buildroot $@

