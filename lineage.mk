## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := n370b

# Inherit some common CM stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/doogee/n370b/device_n370b.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
DEVICE_RESOLUTION := 720x1280
## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n370b
PRODUCT_NAME := lineage_n370b
PRODUCT_BRAND := Doogee
PRODUCT_MODEL := Doogee X5 Max Pro
PRODUCT_MANUFACTURER := Doogee
PRODUCT_LOCALES := en_US en_GB ru_RU uk_UA tr_TR sk_SK vi_VN fr_FR ar_EG
