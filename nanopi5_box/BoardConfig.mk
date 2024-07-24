#
# Copyright 2014 The Android Open-Source Project
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

include device/rockchip/rk356x/BoardConfig.mk
BUILD_WITH_GO_OPT := false

PRODUCT_KERNEL_DTS := nanopi5-images
PRODUCT_KERNEL_CONFIG := nanopi5_android_defconfig
PRODUCT_UBOOT_CONFIG := nanopi5

CURRENT_SDK_VERSION := rk3568_ANDROID12.0_BOX_V1.0

BOARD_HS_ETHERNET := true
PRODUCT_HAVE_PCIE_ETHERNET := true

BOARD_CAMERA_SUPPORT_EXT := true
# camera auto frame feature
PRODUCT_HAVE_EPTZ := false

TARGET_ROCKCHIP_PCBATEST := false

# Wifi.
WIFI_DRIVER_FW_PATH_PARAM := "/dev/null"
WIFI_DRIVER_FW_PATH_STA   := "/dev/null"
WIFI_DRIVER_FW_PATH_AP    := "/dev/null"

BOARD_HAVE_BLUETOOTH_BCM  := false
BOARD_HAVE_BLUETOOTH_RTK  := false
TARGET_USE_BTLINUX_HAL_IMPL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/rockchip/rk356x/nanopi5/bluetooth

# No dtbo.img in boot.img
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_PREBUILT_DTBIMAGE_DIR :=

BOARD_INCLUDE_RECOVERY_DTBO :=
BOARD_PREBUILT_DTBOIMAGE := device/rockchip/rk356x/nanopi5_box/dtbo.img
TARGET_RECOVERY_FSTAB := device/rockchip/rk356x/nanopi5_box/recovery.fstab

BOARD_CACHEIMAGE_PARTITION_SIZE := 281018368
BOARD_SUPER_PARTITION_SIZE := 2684354560
BOARD_WITH_BACKUP_PARTITION := backup:128M
BOARD_WITH_SPECIAL_PARTITIONS := baseparameter:4M

# AB image definition
BOARD_USES_AB_IMAGE ?= true
BOARD_ROCKCHIP_VIRTUAL_AB_ENABLE := true

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
    PRODUCT_UBOOT_CONFIG := nanopi5_ab

    AB_OTA_UPDATER := true
    BOARD_USES_RECOVERY_AS_BOOT := true
    BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
    BOARD_SUPER_PARTITION_SIZE := 3355443200
    BOARD_ROCKCHIP_BASE_PARTITION := security:4M,uboot_a:4M,misc:4M
    BOARD_ROCKCHIP_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304)

    TARGET_NO_RECOVERY := true
    TARGET_ROCKCHIP_PCBATEST := false
    TARGET_RECOVERY_FSTAB := device/rockchip/rk356x/nanopi5_box/recovery.fstab_AB
endif

