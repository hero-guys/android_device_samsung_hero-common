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
  libion
PRODUCT_COPY_FILES += \
  frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
  frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# Audio
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  audio.usb.default \
  audio.r_submix.default \
  audio.primary.universal8890
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
  $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/etc/mixer_paths_0.xml \
  frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Camera
PRODUCT_COPY_FILES += \
  frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
  frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
  frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
  frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
  frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI BSP
ifeq ($(WITH_SLSI_BSP),true)
-include $(LOCAL_PATH)/slsi.mk
endif

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
