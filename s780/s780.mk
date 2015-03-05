#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product, vendor/softwinner/s780/s780-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product, device/softwinner/s780/packages/Android.mk)

$(call inherit-product, build/target/product/full_base.mk)

# All languages
$(call inherit-product, build/target/product/languages_full.mk)

LOCAL_PATH := device/softwinner/s780

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

include $(call all-makefiles-under, $(LOCAL_PATH))

# Copy to root directory
PRODUCT_COPY_FILES += \
	vendor/softwinner/s780/proprietary/vendor/modules/nand.ko:root/nand.ko \
	$(LOCAL_PATH)/fstab.sun7i:root/fstab.sun7i \
	$(LOCAL_PATH)/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/root/initlogo.rle:root/initlogo.rle \
	$(LOCAL_PATH)/root/init.sun7i.rc:root/init.sun7i.rc \
	$(LOCAL_PATH)/root/init.sun7i.usb.rc:root/init.sun7i.usb.rc \
	$(LOCAL_PATH)/root/ueventd.sun7i.rc:root/ueventd.sun7i.rc \
	$(LOCAL_PATH)/root/init.tw_evdo.rc:root/init.tw_evdo.rc \
	$(LOCAL_PATH)/root/init.tw_wcdma.rc:root/init.tw_wcdma.rc \
	$(LOCAL_PATH)/root/init.none.rc:root/init.none.rc \
	$(LOCAL_PATH)/root/init.m1190_gsm.rc:root/init.m1190_gsm.rc \
	$(LOCAL_PATH)/root/init.m7281_wcdma.rc:root/init.m7281_wcdma.rc \
	$(LOCAL_PATH)/root/init.mg191_wcdma.rc:root/init.mg191_wcdma.rc \
	$(LOCAL_PATH)/root/init.mu509_wcdma.rc:root/init.mu509_wcdma.rc \
	$(LOCAL_PATH)/root/init.zte3732_wcdma.rc:root/init.zte3732_wcdma.rc

# Copy to recovery directory
PRODUCT_COPY_FILES += \
	vendor/softwinner/s780/proprietary/vendor/modules/nand.ko:recovery/root/nand.ko \
	$(LOCAL_PATH)/recovery.fstab:recovery/root/recovery.fstab \
	$(LOCAL_PATH)/fstab.sun7i:recovery/root/fstab.sun7i \
	$(LOCAL_PATH)/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/root/initlogo.rle:recovery/root/initlogo.rle \
	$(LOCAL_PATH)/root/init.sun7i.rc:recovery/root/init.sun7i.rc \
	$(LOCAL_PATH)/root/init.sun7i.usb.rc:recovery/root/init.sun7i.usb.rc \
	$(LOCAL_PATH)/root/ueventd.sun7i.rc:recovery/root/ueventd.sun7i.rc

# Copy all files from prebuilts
$(shell $(LOCAL_PATH)/create_prebuilt_files_mk.sh > $(LOCAL_PATH)/PrebuiltFiles.mk)
include $(LOCAL_PATH)/PrebuiltFiles.mk

# CedarX crack
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/CedarX-Crack/libdemux_rmvb.so:system/lib/libdemux_rmvb.so \
	$(LOCAL_PATH)/CedarX-Crack/librm.so:system/lib/librm.so \
	$(LOCAL_PATH)/CedarX-Crack/libswa1.so:system/lib/libswa1.so \
	$(LOCAL_PATH)/CedarX-Crack/libswa2.so:system/lib/libswa2.so

# Build gralloc fix
PRODUCT_COPY_FILES += \
	vendor/softwinner/s780/proprietary/lib/libMali.so:obj/lib/libMali.so \
	vendor/softwinner/s780/proprietary/lib/libUMP.so:obj/lib/libUMP.so

# Permission files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# GPS
BOARD_USES_GPS_TYPE := simulator
PRODUCT_PACKAGES += \
	gps.exDroid

# 3G
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# Gralloc
PRODUCT_PACKAGES += \
	gralloc.sun7i

# HW display and lights
PRODUCT_PACKAGES += \
	display.sun7i \
	lights.sun7i

# Sensors
PRODUCT_PACKAGES += \
	camera.exDroid \
	sensors.exDroid \
	hwcomposer.exDroid \
	libion

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.exDroid

# EXT4 filesystem utils
PRODUCT_PACKAGES += \
	e2fsck \
	libext2fs \
	libext2_blkid \
	libext2_uuid \
	libext2_profile \
	libext2_com_err \
	libext2_e2p \
	make_ext4fs

# Charger mode
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Libraries
PRODUCT_PACKAGES += \
	libCedarA \
	libCedarX \
	libcedarxbase \
	libcedarxosal \
	libcedarv \
	libcedarv_base \
	libcedarv_adapter \
	libve \
	libaw_audio \
	libaw_audioa \
	libswdrm \
	libstagefright_soft_cedar_h264dec \
	libfacedetection \
	libthirdpartstream \
	libcedarxsftstream \
	libsunxi_alloc \
	libsrec_jni \
	libjpgenc \
	libstagefrighthw \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libaw_h264enc \
	libI420colorconvert \
	libion_alloc

# When set ro.sys.adaptive_memory=1, firmware can adaptive different dram size.
# And dalvik vm parameters configuration will become invalid.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.adaptive_memory=1

# USB
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp \
	ro.udisk.lable=WING \
	ro.adb.secure=1

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

PRODUCT_PROPERTY_OVERRIDES += \
	ro.additionalmounts=/storage/sdcard1 \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	persist.sys.vold.switchexternal=0

# Locale
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Athens \
	persist.sys.language=en \
	persist.sys.country=US

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=120 \
	ro.property.tabletUI=true \
	ro.property.fontScale=1.0 \
	ro.kernel.android.checkjni=0 \
	ro.opengles.version=131072 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1 \
	ro.sys.cputype=DualCore-A20 \
	keyguard.no_require_sim=true

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# APP CONFIGS
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := large xlarge hdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 800

# CM bootanimation
PRODUCT_COPY_FILES += vendor/cm/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

PRODUCT_NAME := cm_s780
PRODUCT_DEVICE := s780
PRODUCT_BRAND := Allwinner
PRODUCT_MODEL := WING-S780
PRODUCT_MANUFACTURER := Allwinner Technology
PRODUCT_RELEASE_NAME := wing-s780
