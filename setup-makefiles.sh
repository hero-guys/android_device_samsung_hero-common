#!/bin/bash
# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

set -e

DEVICE_COMMON=hero-common
DEVICE="hero2lte herolte"
VENDOR=samsung

INITIAL_COPYRIGHT_YEAR=2017

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/cm/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
source "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$CM_ROOT" true

# Copyright headers and guards
write_headers "$DEVICE"

# The standard blobs
write_makefiles "$MY_DIR"/proprietary-files.txt

# Samsung SLSI blobs
cat << EOF >> "$PRODUCTMK"
ifneq (\$(WITH_SLSI_BSP),true)
EOF

write_makefiles "$MY_DIR"/proprietary-files-slsi.txt

echo "endif" >> "$PRODUCTMK"

# Vulkan symlink
(cat << "EOF") >> "$ANDROIDMK"
include $(CLEAR_VARS)
LOCAL_MODULE := libGLES_mali
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES_64 := proprietary/vendor/lib64/egl/libGLES_mali.so
LOCAL_SRC_FILES_32 := proprietary/vendor/lib/egl/libGLES_mali.so
LOCAL_MULTILIB := both
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH_32 := $($(TARGET_2ND_ARCH_VAR_PREFIX)TARGET_OUT_VENDOR_SHARED_LIBRARIES)/egl
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/egl
include $(BUILD_PREBUILT)

SYMLINKS := $(TARGET_OUT)/vendor
$(SYMLINKS):
	@echo "Symlink: vulkan.exynos5.so"
	@mkdir -p $@/lib/hw
	@mkdir -p $@/lib64/hw
	$(hide) ln -sf ../egl/libGLES_mali.so $@/lib/hw/vulkan.exynos5.so
	$(hide) ln -sf ../egl/libGLES_mali.so $@/lib64/hw/vulkan.exynos5.so
	@echo "Symlink: libOpenCL.so.1.1"
	$(hide) ln -sf egl/libGLES_mali.so $@/lib/libOpenCL.so.1.1
	$(hide) ln -sf egl/libGLES_mali.so $@/lib64/libOpenCL.so.1.1

ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)
EOF

# Exynos HWC service blob
(cat << "EOF") >> "$ANDROIDMK"

ifneq ($(WITH_SLSI_BSP),true)
include $(CLEAR_VARS)
LOCAL_MODULE := libExynosHWCService
LOCAL_SRC_FILES_32 := proprietary/lib/libExynosHWCService.so
LOCAL_SRC_FILES_64 := proprietary/lib64/libExynosHWCService.so
LOCAL_MULTILIB := both
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
endif

EOF

# We are done!
write_footers
