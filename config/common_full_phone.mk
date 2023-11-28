# Inherit full common Ocean-UI stuff
$(call inherit-product, vendor/ocean/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Ocean-UI LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/ocean/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/ocean/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/ocean/config/telephony.mk)
