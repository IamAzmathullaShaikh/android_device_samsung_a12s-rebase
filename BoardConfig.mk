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
TARGET_KERNEL_CONFIG := kawa_defconfig
KERNEL_LD := LD=ld.lld

### VENDOR PROPS
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

