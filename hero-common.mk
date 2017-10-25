# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/samsung/hero-common

# Device
PRODUCT_PACKAGES += \
  frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Image
PRODUCT_PACKAGES += \
  dtbhtoolExynos

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI BSP
ifeq ($(WITH_SLSI_BSP),true)
-include $(LOCAL_PATH)/slsi.mk
endif

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
