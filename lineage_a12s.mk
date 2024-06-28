#
# Copyright (C) 2020-2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Inherit from generic products, most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## Inherit from a21s device
$(call inherit-product, device/samsung/a12s/device.mk)

## Boot Animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

## Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

## Device identifier, this must come after all inclusions
PRODUCT_DEVICE := a12s
PRODUCT_NAME := lineage_a12s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A127F
PRODUCT_MANUFACTURER := samsung
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_GMS_CLIENTID_BASE := android-samsung

#PRODUCT_PDA_MODEL := A127F
#PRODUCT_PDA_MODEL_VERSION := XXSADWI1
#PRODUCT_PDA_VERSION := $(PRODUCT_PDA_MODEL)$(PRODUCT_PDA_MODEL_VERSION)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=a12s \
    PRODUCT_DEVICE=a12s

#\PRIVATE_BUILD_DESC="a21s-user 12 SP1A.210812.016 $(PRODUCT_PDA_VERSION) release-keys"

#BUILD_FINGERPRINT := samsung/a21snsxx/a21s:12/SP1A.210812.016/$(PRODUCT_PDA_VERSION):user/release-keys

#PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.PDA=$(PRODUCT_PDA_VERSION)

ifneq ($(LINEAGE_DEV_CERTIFICATE),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(LINEAGE_DEV_CERTIFICATE)
endif


# Adb
ifeq ($(TARGET_BUILD_VARIANT), userdebug, eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb \
    persist.vendor.usb.config=mtp,adb
endif
