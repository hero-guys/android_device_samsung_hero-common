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

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos8890/exynos8890.mk)

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
