#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/nvidia/tegratab/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

PRODUCT_AAPT_CONFIG += mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

PRODUCT_CHARACTERISTICS := tablet

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

$(call inherit-product, vendor/nvidia/tegratab/tegratab-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/tegratab/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.tegratab \
    init.hdcp.rc \
    init.recovery.tegratab.rc \
    init.tegratab.rc \
    init.tegratab.usb.rc \
    init.tf.rc \
    init.ussrd.rc \
    power.tegratab.rc \
    ueventd.tegratab.rc

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

PRODUCT_PACKAGES += \
    tinyalsa \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf

# idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    $(LOCAL_PATH)/idc/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
    $(LOCAL_PATH)/idc/touch_fusion.idc:system/usr/idc/touch_fusion.idc

# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Lights
PRODUCT_PACKAGES += \
    lights.tegratab

# Power
PRODUCT_PACKAGES += \
    power.tegratab

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_RUNTIMES := runtime_libart_default
