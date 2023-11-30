PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0

ifeq ($(OCEAN_VERSION_APPEND_TIME_OF_DAY),true)
    OCEAN_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    OCEAN_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set OCEAN_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef OCEAN_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "OCEAN_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^OCEAN_||g')
        OCEAN_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Check Official
ifeq ($(OCEAN_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/ocean/ocean.devices)
    ifeq ($(filter $(OCEAN_BUILD), $(LIST)), $(OCEAN_BUILD))
      OCEAN_BUILD_TYPE := OFFICIAL
    else 
      OCEAN_BUILD_TYPE := UNOFFICIAL
    endif
endif

ifeq ($(OCEAN_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        OCEAN_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

OCEAN_VERSION_SUFFIX := $(OCEAN_BUILD_DATE)-$(OCEAN_BUILDTYPE)$(OCEAN_EXTRAVERSION)-$(OCEAN_BUILD)

# Internal version
OCEAN_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(OCEAN_VERSION_SUFFIX)

# Display version
OCEAN_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(OCEAN_VERSION_SUFFIX)

# Codename version
OCEAN_DISPLAY_VERSION_CODENAME := 13-ArcticExpress