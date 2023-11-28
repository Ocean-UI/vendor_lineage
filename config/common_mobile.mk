# Inherit common mobile Ocean-UI stuff
$(call inherit-product, vendor/ocean/config/common.mk)

# Include AOSP audio files
include vendor/ocean/config/aosp_audio.mk

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true