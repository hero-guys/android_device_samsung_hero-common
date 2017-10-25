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

# We are done!
write_footers
