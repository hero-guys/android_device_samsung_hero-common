# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
# Device specific property overrides

# Boot device
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
  ro.boot.bootdevice=155a0000.ufs

# Display
PRODUCT_PROPERTY_OVERRIDES += \
  ro.opengles.version=196609 \
  ro.hwui.texture_cache_size=88 \
  ro.hwui.layer_cache_size=58 \
  ro.hwui.path_cache_size=16 \
  ro.hwui.texture_cache_flushrate=0.4 \
  ro.hwui.shape_cache_size=4 \
  ro.hwui.gradient_cache_size=2 \
  ro.hwui.drop_shadow_cache_size=6 \
  ro.hwui.r_buffer_cache_size=8 \
  ro.hwui.text_small_cache_width=1024 \
  ro.hwui.text_small_cache_height=1024 \
  ro.hwui.text_large_cache_width=4096 \
  ro.hwui.text_large_cache_height=2048

# Dalvik / ART
PRODUCT_PROPERTY_OVERRIDES += \
  dalvik.vm.heapstartsize=8m \
  dalvik.vm.heapgrowthlimit=256m \
  dalvik.vm.heapsize=512m \
  dalvik.vm.heaptargetutilization=0.75 \
  dalvik.vm.heapminfree=2m \
  dalvik.vm.heapmaxfree=8m

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
  af.fast_track_multiplier=1 \
  audio_hal.force_voice_config=wide

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
  ro.bt.bdaddr_path="/efs/bluetooth/bt_addr" \
  qcom.bluetooth.soc=rome

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
  persist.radio.add_power_save=1 \
  persist.radio.apm_sim_not_pwdn=1 \
  rild.libpath=/system/lib64/libsec-ril.so \
  rild.libpath2=/system/lib64/libsec-ril-dsds.so \
  ro.telephony.default_network=9 \
  ro.telephony.ril_class=SlteRIL \
  ro.ril.gprsclass=10 \
  ro.ril.hsxpa=1 \
  ro.ril.telephony.mqanelements=6 \
  telephony.lteOnGsmDevice=1 \
  telephony.lteOnCdmaDevice=0
