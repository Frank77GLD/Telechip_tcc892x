# Product-specific compile-time definitions.
# BoardConfig.mk - This is the meat of it all, this is where compiler conditional flags are set, partition layouts, boot addresses, ramdisk size, and so on.
LOCAL_PATH:= $(call my-dir)
USE_CAMERA_STUB := true
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

# Disable PIE since it breaks ICS camera blobs
#TARGET_DISABLE_ARM_PIE := true

# Use screencap to capture frame buffer for ddms
#BOARD_USE_SCREENCAP := true

# inherit from the proprietary version
#-include vendor/YG/m805_892x/BoardConfigVendor.mk
-include device/YG/m805_892x/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tcc892x
# org: TARGET_BOARD_PLATFORM := unknown
#TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
#LOCAL_ARM_MODE := arm
#TARGET_ARCH_VARIANT_CPU := cortex-a8
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
#TARGET_ARCH_VARIANT_FPU := vfpv3-d16
#TARGET_ARCH_VARIANT_FPU := vfpv3
#TARGET_ARCH_VARIANT_FPU := vfp
#TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
#ANDROID_ARM_LINKER := true
TARGET_BOOTLOADER_BOARD_NAME := m805_892x
TARGET_PROVIDES_LIBRIL := device/YG/m805_892x/proprietary/lib/libril.so
BUILD_ID=A777

#EGL stuff
# GPU and video configration parameters
# mali-400 MP? ?OpenGL ES-CM 1.1 klopt
TARGET_BOARD_PLATFORM_GPU := ARM-Mali-400 MP
# OpenGL drivers config file path
BOARD_EGL_CFG := device/YG/m805_892x/common/egl.cfg
# BOARD_EGL_CFG := device/YG/m805_892x/proprietary/lib/egl.cfg
#TARGET_HARDWARE_3D := true
USE_OPENGL_RENDERER := true
#ENABLE_WEBGL := true

#werkte niet in hier.
#PRODUCT_CHARACTERISTICS := tablet,sdcard
#TARGET_DISPLAY := 7inch
#TARGET_RESISTIVE_TS := false

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true
# Use a smaller subset of system fonts to keep image size lower
SMALLER_FONT_FOOTPRINT := true

BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

# fix this up by examining /proc/mtd on a running device
# You can double check it with fdisk -l /dev/block/mmcblk0
# sample. Place the 0x in front of the ¨size¨
#Tom-Tec 7 exl. geeft:
#dev: size:    erasersize: name:
#mtd0 00a00000 00100000 ¨boot¨
#mtd1 00500000 00100000 ¨kpanic¨
#mtd2 12c00000 00100000 ¨system¨
#mtd3 00400000 00100000 ¨plash¨
#mtd4 09600000 00100000 ¨cache¨
#mtd5 40000000 00100000 ¨userdata¨
#mtd6 00a00000 00100000 ¨recovery¨
#mtd7 00100000 00100000 ¨misc¨
#mtd8 00100000 00100000 ¨tcc¨
# Here onder in bytes size for use with ext4 partition?:
#BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 314572800
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
# Here under is for tom-tec without using ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12c00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x40000000
#BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PREBUILT_KERNEL := device/YG/m805_892x/kernel

TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_INITRC := device/YG/m805_892x/recovery/init.rc

# Board hase no Bluetooth.
#BOARD_HAVE_BLUETOOTH := false
# TARGET_NO_KERNEL := false
#TARGET_NO_RECOVERY := false
# TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAVE_FAKE_GPS := true
BOARD_HAVE_WIFI := true
#BOARD_USE_WIFI := true
#BOARD_USE_USB_MASS_STORAGE_SWITCH := true

BOARD_WPA_SUPPLICANT_DRIVER :=Dwext
WIFI_DRIVER_MODULE_PATH := "/system/wifi/wlan.ko"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_FIRMWARE_LOADER := ""
WITH_JIT := true
#TARGET_HAVE_TSLIB:=true
#JS_ENGINE:=v8
ENABLE_JSC_JIT:=true
BUILD_WITH_FULL_STAGEFRIGHT:=true

#See init.rc file?
#BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
#for tomtec usb:
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file
# USB
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

#BOARD_USES_OVERLAY := true

# Storage Internal sd aka emmc
# Internal SD card for recovery and such
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/ndda1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/ndda
#BOARD_SDEXT_DEVICE := /dev/block/platform/tcc-sdhc0.0/mmcblk0
#BOARD_SDEXT_DEVICE := /dev/block/platform/tcc-sdhc0.0
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0

# Setting this to avoid boot locks on the system from using the "misc" partition.
#BOARD_HAS_NO_MISC_PARTITION := true
# BOARD_HAS_NO_MISC_PARTITION := false

#TARGET_BOARD_RAM := 1GB
#BOARD_USES_SECURE_SERVICES := true
#BOARD_ALWAYS_INSECURE := true

# Boot animation. nog testen.
#TARGET_SCREEN_HEIGHT := 800 
#TARGET_SCREEN_WIDTH := 480
#TARGET_BOOTANIMATION_PRELOAD := true
# TARGET_BOOTANIMATION_TEXTURE_CACHE := true

#Config for building TWRP recovery if you want to build that. Will need changing!
# DEVICE_RESOLUTION := 800x480
# RECOVERY_TOUCHSCREEN_SWAP_XY := true
# RECOVERY_TOUCHSCREEN_FLIP_Y := true
# TW_NO_REBOOT_BOOTLOADER := true
# TW_NO_REBOOT_RECOVERY := true
# TW_INTERNAL_STORAGE_PATH := "/emmc"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
# TW_INTERNAL_STORAGE_PATH := "/mnt/sdcard"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
# TW_EXTERNAL_STORAGE_PATH := "/sdc"
# TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdc"
# TW_EXTERNAL_STORAGE_PATH := "mnt/ext_sd"
# TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdc"

BOARD_HAS_NO_SELECT_BUTTON := false
# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
## Generate descriptive build.id. Als test for now..
DISPLAY_BUILD_NUMBER := true

# Lights
#TARGET_PROVIDES_LIBLIGHTS := true

# ICS FLAGS for compatibility
#BOARD_USE_LEGACY_TOUCHSCREEN := true
#TARGET_USES_OLD_LIBSENSORS_HAL := true
#TARGET_SENSORS_NO_OPEN_CHECK := true
#BOARD_PROVIDES_LIBRIL := true
TARGET_PROVIDES_LIBRIL := true
# Override cyanogen squisher to customize our update zip package
#TARGET_CUSTOM_RELEASETOOL := ./device/malata/smb_a1002/releasetools/squisher
