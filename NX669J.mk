include build/make/target/product/aosp_arm64_ab.mk

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/nubia/NX669J/sepolicy

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, vendor/foss/foss.mk)

PPRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.adb.secure=1 \
	ro.debuggable=0

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier

PRODUCT_PACKAGES += \
	bootctrl.sdm888 \
    bootctrl.sdm888.recovery

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service 
	
PRODUCT_PACKAGES += \
	fastbootd \
	bootctl \
	vintf \
    simg2img_simple \
    lptools \
	lightsctl \
    uevent \
	curl \
	healthd \
	Stk 

# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    update_engine_sideload \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

ifneq (,$(wildcard external/exfat))
PRODUCT_PACKAGES += \
	mkfs.exfat \
	fsck.exfat
endif

SELINUX_IGNORE_NEVERALLOWS := true

PRODUCT_PACKAGES_DEBUG := 

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	debug.fdsan=warn_once \


$(call inherit-product-if-exists, vendor/nubia/NX669J/NX669J-vendor.mk)


PRODUCT_MANUFACTURER := nubia
PRODUCT_NAME := NX669J
PRODUCT_DEVICE := NX669J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX669J

PRODUCT_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay
	