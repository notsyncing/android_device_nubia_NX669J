include build/make/target/board/generic_arm64_ab/BoardConfig.mk

LOCAL_PATH := device/nubia/NX669J

TARGET_BOARD_PLATFORM := sdm888
TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo680

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := $(TARGET_ARCH_VARIANT)
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := $(TARGET_CPU_VARIANT_RUNTIME)

BOARD_KERNEL_CMDLINE := 

BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 4096
BOARD_KERNEL_OFFSET       := 0x00001000
BOARD_RAMDISK_OFFSET      := 0x029e2000
BOARD_BOOT_HEADER_VERSION := 3

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/recovery/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/lib64/libboot_control_qti.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libboot_control_qti.so \
    $(LOCAL_PATH)/recovery/lib64/hw/android.hardware.boot@1.0-impl-1.1-qti.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/hw/android.hardware.boot@1.0-impl-1.1-qti.so 


TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000

TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/etc/recovery.fstab

TARGET_EXFAT_DRIVER := exfat

ifeq ($(BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE),)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
else
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 33554432
endif



DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    device/nubia/NX669J/device_compatibility_matrix.xml


include device/qcom/sepolicy/SEPolicy.mk

TARGET_SYSTEM_EXT_PROP := device/nubia/NX669J/system_ext.prop

BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.device.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.device.rc \
    $(LOCAL_PATH)/empty_file:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/empty_file