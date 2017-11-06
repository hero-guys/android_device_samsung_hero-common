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

# Media
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
  $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Wi-Fi
PRODUCT_PACKAGES += \
  macloader \
  wifiloader \
  hostapd \
  libwpa_client \
  wpa_supplicant
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/wifi/cred.conf:system/etc/wifi/cred.conf \
  $(LOCAL_PATH)/configs/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
  $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
  $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
  $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
  $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
  frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
  frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Bluetooth
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
  frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Radio
PRODUCT_PACKAGES += \
  libxml2 \
  libprotobuf-cpp-full
PRODUCT_COPY_FILES += \
  frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Property overrides
-include $(LOCAL_PATH)/system_prop.mk

# Call Samsung LSI BSP
ifeq ($(WITH_SLSI_BSP),true)
-include $(LOCAL_PATH)/slsi.mk
endif

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
