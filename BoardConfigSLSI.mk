# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/samsung/hero-common

# Display
BOARD_USES_EXYNOS5_COMMON_GRALLOC := true

# H/W composer
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USES_VPP := true
BOARD_USES_VPP_V2 := true
BOARD_HDMI_INCAPABLE := true

# Scaler
BOARD_USES_DEFAULT_CSC_HW_SCALER := true
BOARD_USES_DT := true
BOARD_USES_SCALER_M2M1SHOT := true
BOARD_USES_SCALER_LOCAL_CID := true
BOARD_USES_SCALER_PREMUL_FMT := true

# FIMG
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_FIMGAPI_V5X := true

# Camera
TARGET_USES_UNIVERSAL_LIBHWJPEG := true
