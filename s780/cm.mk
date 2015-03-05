#
# Copyright (C) 2011 The Android Open-Source Project
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

# Inherit device configuration
$(call inherit-product, device/softwinner/s780/s780.mk)

# Inherit some common CyanogenMod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_s780
PRODUCT_DEVICE := s780
PRODUCT_BRAND := Allwinner
PRODUCT_MODEL := WING-S780
PRODUCT_MANUFACTURER := Allwinner Technology
PRODUCT_RELEASE_NAME := wing-s780
UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi TARGET_DEVICE=grouper BUILD_FINGERPRINT="google/nakasi/grouper:4.2.2/JDQ39E/402395:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.2.2 JDQ39E 402395 release-keys"

# Allow ADB (to access dev settings)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
ro.adb.secure=0 \
ro.secure=0 \
ro.allow.mock.location=1 \
service.adb.enable=1 \
persist.sys.usb.config=mass_storage \
ro.debuggable=1 \
persist.service.adb.enable=1 \
rild.libpath=/system/lib/libsoftwinner-ril.so
