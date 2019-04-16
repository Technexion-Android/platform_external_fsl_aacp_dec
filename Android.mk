ifeq ($(PREBUILT_FSL_IMX_CODEC),true)

LOCAL_PATH := $(call my-dir)

MAJOR_VERSION := $(shell echo $(PLATFORM_VERSION) | cut -d "." -f1)
ANDROID_VERSION_GE_O := $(shell if [ $(MAJOR_VERSION) -ge 8 ];then echo "true";fi)

ifeq ($(ANDROID_VERSION_GE_O), true)
    FSL_CODEC_OUT_PATH := $(TARGET_OUT_VENDOR)
else
    FSL_CODEC_OUT_PATH := $(TARGET_OUT)
endif

include $(CLEAR_VARS)

LOCAL_MODULE := lib_aacplus_dec_v2_arm11_elinux
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
ifdef TARGET_2ND_ARCH
LOCAL_MULTILIB := both
LOCAL_MODULE_PATH_64 := $(FSL_CODEC_OUT_PATH)/lib64
LOCAL_SRC_FILES_64 := arch64/lib_aacplus_dec_arm_android.so
LOCAL_MODULE_PATH_32 := $(FSL_CODEC_OUT_PATH)/lib/
LOCAL_SRC_FILES_32 := arch32/lib_aacplus_dec_v2_arm11_elinux.so
LOCAL_POST_INSTALL_CMD := cd $(FSL_CODEC_OUT_PATH); \
                          ln -sf ./lib_aacplus_dec_v2_arm11_elinux.so lib/lib_aacplus_dec.so; \
                          ln -sf ./lib_aacplus_dec_v2_arm11_elinux.so lib64/lib_aacplus_dec.so;
else
LOCAL_POST_INSTALL_CMD := cd $(FSL_CODEC_OUT_PATH); \
                          ln -sf ./lib_aacplus_dec_v2_arm11_elinux.so lib/lib_aacplus_dec.so;
LOCAL_MODULE_PATH := $(FSL_CODEC_OUT_PATH)/lib
LOCAL_SRC_FILES := arch32/lib_aacplus_dec_v2_arm11_elinux.so
endif
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lib_aacplusd_wrap_arm12_elinux_android
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
ifdef TARGET_2ND_ARCH
LOCAL_MULTILIB := both
LOCAL_MODULE_PATH_64 := $(FSL_CODEC_OUT_PATH)/lib64
LOCAL_SRC_FILES_64 := arch64/lib_aacplusd_wrap_arm_android.so
LOCAL_MODULE_PATH_32 := $(FSL_CODEC_OUT_PATH)/lib/
LOCAL_SRC_FILES_32 := arch32/lib_aacplusd_wrap_arm12_elinux_android.so
else
LOCAL_MODULE_PATH := $(FSL_CODEC_OUT_PATH)/lib
LOCAL_SRC_FILES := arch32/lib_aacplusd_wrap_arm12_elinux_android.so
endif
include $(BUILD_PREBUILT)

endif
