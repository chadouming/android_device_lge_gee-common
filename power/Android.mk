ifneq ($(filter geeb gee_intl geespr,$(TARGET_DEVICE)),)
LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c

# Include target-specific files.
ifeq ($(TARGET_BOARD_PLATFORM),msm8974)
LOCAL_SRC_FILES += power-8974.c
endif

ifeq ($(TARGET_BOARD_PLATFORM),msm8226)
LOCAL_SRC_FILES += power-8226.c
endif

ifeq ($(TARGET_BOARD_PLATFORM),msm8610)
LOCAL_SRC_FILES += power-8610.c
endif

ifeq ($(TARGET_BOARD_PLATFORM),msm8960)
LOCAL_SRC_FILES += power-8960.c
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

LOCAL_MODULE := power.qcom
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif
