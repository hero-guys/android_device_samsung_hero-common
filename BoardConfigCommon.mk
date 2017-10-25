# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/samsung/hero-common

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos8890
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

# Binder
TARGET_USES_64_BIT_BINDER := true

# CPUsets
ENABLE_CPUSETS := true

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53.a57
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := exynos-m1

# Hardware
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/cmhw

# SELinux
BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# SECComp filters
BOARD_SECCOMP_POLICY += $(LOCAL_PATH)/seccomp

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Image
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/samsung/universal8890
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Inherit SLSI specific defines
ifeq ($(WITH_SLSI_BSP),true)
-include $(LOCAL_PATH)/BoardConfigSLSI.mk
endif

# Inherit from the proprietary version
-include vendor/samsung/hero-common/BoardConfigVendor.mk
