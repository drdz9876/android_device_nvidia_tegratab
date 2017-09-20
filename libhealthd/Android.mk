LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= healthd_board_tegra.cpp
LOCAL_C_INCLUDES:= system/core/healthd
LOCAL_MODULE:= libhealthd.tegra
include $(BUILD_STATIC_LIBRARY)
