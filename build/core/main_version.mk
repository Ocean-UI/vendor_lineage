# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Ocean-UI System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.version=$(OCEAN_VERSION) \
    ro.ocean.releasetype=$(OCEAN_BUILDTYPE) \
    ro.ocean.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(OCEAN_VERSION) \

# Ocean-UI Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.display.version=$(OCEAN_DISPLAY_VERSION)

# Ocean-UI Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.build.version.plat.sdk=$(OCEAN_PLATFORM_SDK_VERSION)

# DroidX-UI Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.build.version.plat.rev=$(OCEAN_PLATFORM_REV)