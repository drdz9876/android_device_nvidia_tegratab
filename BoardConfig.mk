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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Assert
#TARGET_OTA_ASSERT_DEVICE := tegratab

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := tegratab
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=tegratab
#TARGET_KERNEL_SOURCE := kernel/nvidia/tegratab
#TARGET_KERNEL_CONFIG := cyanogenmod_tegratab_defconfig
#TARGET_USE_DTB := true
#TARGET_KERNEL_DT_NAME := tegra114-tegratab
#APPEND_DTB_TO_KERNEL := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/tegratab/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_TI_BLUETOOTH := true

# Graphics
USE_E2FSPROGS := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Media
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Partition
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE    := 805306368
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13704888320
BOARD_FLASH_BLOCK_SIZE             := 4096

# powerhal
BOARD_USES_TEGRA_POWERHAL := true

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/nvidia/tegratab/rootdir/etc/fstab.tegratab

# Camera options
USE_CAMERA_STUB := false

# Wifi related defines
BOARD_WLAN_DEVICE           := wl18xx_mac80211
BOARD_SOFTAP_DEVICE         := wl18xx_mac80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_MODULE_NAME     := "wlcore_sdio"
WIFI_FIRMWARE_LOADER        := ""

BOARD_HARDWARE_CLASS := device/nvidia/tegratab/cmhw/

MALLOC_IMPL := dlmalloc

# sepolicy
BOARD_SEPOLICY_DIRS := device/nvidia/tegratab/sepolicy
BOARD_SEPOLICY_UNION += \
	app.te \
	bluetooth.te \
	bootanim.te \
	camera_lbh.te \
	cpuvoltcap.te \
	debuggerd.te \
	device.te \
	dex2oat.te \
	domain.te \
	drmserver.te \
	dumpstate.te \
	file_contexts \
	file.te \
	genfs_contexts \
	gpload.te \
	gpsd.te \
	healthd.te \
	hostapd.te \
	init.te \
	installd.te \
	lbh-setup.te \
	link_lbh.te \
	maxim.te \
	mediaserver.te \
	netd.te \
	platform_app.te \
	property_contexts \
	property.te \
	service_contexts \
	setup_fs.te \
	set_hwui.te \
	shell.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	tee.te \
	te_macros \
	ueventd.te \
	untrusted_app.te \
	usb.te \
	usdwatchdog.te \
	ussrd.te \
	ussr_setup.te \
	vold.te \
	wifi_loader.te \
	wl18xx.te \
	wpa.te \
	zygote.te
