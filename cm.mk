## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := m805_892x

# Pakt hem niet op de naam:
# Preload bootanimation. nog proberen.
#TARGET_BOOTANIMATION_PRELOAD := true
#TARGET_BOOTANIMATION_NAME := horizontal-1024x600
#TARGET_BOOTANIMATION_NAME := horizontal-480x800

# Inherit some common CM stuff.
# $(call inherit-product, vendor/cm/config/common_full_phone.mk)
# Inherit some common CM stuff. keer proberen.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit some common CM stuff. Original setting.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/YG/m805_892x/device_m805_892x.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m805_892x
PRODUCT_NAME := cm_m805_892x
#PRODUCT_NAME := full_m805_892x_evm
PRODUCT_BRAND := YG
PRODUCT_MODEL := m805_892x
#PRODUCT_MODEL := A777
PRODUCT_MANUFACTURER := YG

# Set build fingerprint / ID / Product Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_pyramid BUILD_FINGERPRINT=tmous/htc_pyramid/pyramid:4.0.3/IML74K/356011.14:user/release-keys PRIVATE_BUILD_DESC="3.32.531.14 CL356011 release-keys" BUILD_NUMBER=35601
