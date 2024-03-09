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

DEVICE_PATH := device/samsung/a21s

## Inherit from the common tree
include device/samsung/a21s-common/BoardConfigCommon.mk

## Inherit optional vendor BoardConfig
-include vendor/samsung/a21s/BoardConfigVendor.mk

## OTA Asserts
TARGET_OTA_ASSERT_DEVICE := a21s,a21snsxx

## APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

## Display
TARGET_SCREEN_DENSITY := 280

## Kernel config
TARGET_KERNEL_CONFIG := lineage_defconfig

## Partitions Sizes
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 37748736
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55574528
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

## Filesystem
BOARD_SUPER_PARTITION_SIZE := 5536481280
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 5530000000 # SUPER_SIZE - 4MB
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
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200 # 1GB
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200 # 1MB

BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1

### VENDOR PROPS
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

