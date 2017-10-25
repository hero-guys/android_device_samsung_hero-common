LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.samsungexynos8890
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.samsungexynos8890
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := twrp.fstab
LOCAL_MODULE_TAGS  := debug eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_SRC_FILES    := recovery/etc/twrp.fstab
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/etc
include $(BUILD_PREBUILT)
