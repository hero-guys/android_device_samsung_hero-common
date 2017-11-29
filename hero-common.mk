# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/samsung/hero-common

# Device
PRODUCT_PACKAGES += \
  frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Image
PRODUCT_PACKAGES += \
  dtbhtoolExynos

# File system
PRODUCT_PACKAGES += \
  fstab.samsungexynos8890

# Init resources
PRODUCT_PACKAGES += \
  init.samsungexynos8890.rc \
  init.samsungexynos8890.usb.rc \
  init.samsung.rc \
  init.baseband.rc \
  init.gps.rc \
  init.rilchip.rc \
  init.wifi.rc \
  ueventd.samsungexynos8890.rc

# Charger
PRODUCT_PACKAGES += \
  charger_res_images \
  cm_charger_res_images

# Display
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi
PRODUCT_PACKAGES += \
  libion \
  libfimg
PRODUCT_COPY_FILES += \
  frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
  frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos8890/exynos8890.mk)

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
