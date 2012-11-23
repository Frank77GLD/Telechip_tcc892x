# device_xxxxx.mk - specifies the properties and extras to copy over into the final output, in this case, it could be for example, device_m805_892x.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries

DEVICE_PACKAGE_OVERLAYS += device/YG/m805_892x/overlay

$(call inherit-product-if-exists, device/YG/m805_892x/m805_892x-vendor.mk)

PRODUCT_COPY_FILES += \
device/YG/m805_892x/recovery/init.m805_892x.rc:root/init.m805_892x.rc

PRODUCT_COPY_FILES += \
device/YG/m805_892x/lib/modules/ehci-hcd.ko:recovery/root/lib/modules/ehci-hcd.ko \
device/YG/m805_892x/lib/modules/ohci-hcd.ko:recovery/root/lib/modules/ohci-hcd.ko \
device/YG/m805_892x/lib/modules/tcc_mtd.ko:recovery/root/lib/modules/tcc_mtd.ko \
device/YG/m805_892x/lib/modules/tcc_nand.ko:recovery/root/lib/modules/tcc_nand.ko \
device/YG/m805_892x/lib/modules/tcc_ndd.ko:recovery/root/lib/modules/tcc_ndd.ko \
device/YG/m805_892x/lib/modules/ufsd.ko:recovery/root/lib/modules/ufsd.ko \
device/YG/m805_892x/recovery/init.m805_892x.rc:recovery/root/init.m805_892x.rc \
device/YG/m805_892x/recovery/ueventd.m805_892x.rc:recovery/root/ueventd.m805_892x.rc

PRODUCT_COPY_FILES += \
frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xmls \
frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#nieuw toegevoegd. New added/Werk wel. Ook al in BoardConfig werkt niet.
PRODUCT_CHARACTERISTICS := tablet,sdcard

# we have enough storage space to hold precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
ro.product.locale.language=nl \
ro.product.locale.region=NL \
persist.sys.timezone=Europe/Amsterdam

LOCAL_PATH := device/YG/m805_892x
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

-include vendor/cm/config/common_full_tablet_wifionly.mk

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m805_892x
PRODUCT_DEVICE := m805_892x
PRODUCT_MANUFACTURER := YG
