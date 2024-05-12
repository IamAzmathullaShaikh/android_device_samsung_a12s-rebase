#
# Copyright (C) 2020-2021 The LineageOS Project
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

## Inherit from the common tree
include device/samsung/exynos850-common/BoardConfigCommon.mk

## Inherit from the proprietary configuration
include vendor/samsung/a21s/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/a21s

## APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

## Kernel
TARGET_KERNEL_CONFIG := exynos850-a21snsxx_defconfig
KERNEL_LD := LD=ld.lld

TARGET_OTA_ASSERT_DEVICE := a21s,a21snsxx

## Partitions Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 37748736
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55574528
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

## Filesystem
BOARD_SUPER_PARTITION_SIZE := 5557452800
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 5553258496 # SUPER_SIZE - 4MB
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := \
        system \
        product \
        vendor \
        odm

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200 # 1.2GB
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200 # 1.2GB

BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1

## Out location
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_F2FS := true

### VENDOR PROPS
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

