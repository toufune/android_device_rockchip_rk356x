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

# First lunching is S, api_level is 31
PRODUCT_SHIPPING_API_LEVEL := 31

include device/rockchip/rk356x/nanopi5/BoardConfig.mk

# OTA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.updater.next_device=rk3568 \
    ro.product.version=12.1.0 \
    ro.product.releasetype=stable

PRODUCT_PACKAGES += \
    Updater

HAVE_PREBUILT_DTBO := $(shell test -f $(BOARD_PREBUILT_DTBOIMAGE) && echo true)
ifneq ($(HAVE_PREBUILT_DTBO),true)
PRODUCT_DTBO_TEMPLATE := device/rockchip/rk356x/nanopi5/dt-overlay.in
PRODUCT_SDMMC_DEVICE := fe2b0000.dwmmc
endif

include device/rockchip/common/build/rockchip/DynamicPartitions.mk
include device/rockchip/common/BoardConfig.mk

PRODUCT_COPY_FILES += \
    device/rockchip/rk356x/nanopi5/init.rk356x.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk356x.rc

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.init_usb=1

# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk356x/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_FSTAB_TEMPLATE := device/rockchip/rk356x/nanopi5/fstab.in

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := nanopi5
PRODUCT_DEVICE := nanopi5
PRODUCT_BRAND := Android
PRODUCT_MODEL := FriendlyELEC RK3568
PRODUCT_MANUFACTURER := FriendlyELEC (www.friendlyelec.com)

# Screen size is "normal", density is "hdpi"
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

TARGET_BOARD_SUPPORT_4K_UI ?= false
ifeq ($(TARGET_BOARD_SUPPORT_4K_UI),true)
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.framebuffer.main=3840x2160@60
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=350
else
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotates=true \
    ro.vendor.user_rotation=true \
    ro.boot.log_battery=false

PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

PRODUCT_PACKAGES += \
    usb_modeswitch

PRODUCT_COPY_FILES += \
    device/rockchip/rk356x/nanopi5/init.usbmod.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.usbmod.sh

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml

# Audio Policy tables
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml

# Rockchip properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wifi.sleep.power.down=true \
    persist.wifi.sleep.delay.ms=0 \
    persist.bt.power.down=true

PRODUCT_USB_CAMERA_CONFIG := device/rockchip/rk356x/nanopi5/external_camera_config.xml

include device/friendlyelec/nanopi3/input/keyboards.mk
PRODUCT_COPY_FILES += \
    device/rockchip/rk356x/nanopi5_box/remote_config/fe6e0030_pwm.kl:system/usr/keylayout/fe6e0030_pwm.kl

# Quectel
$(call inherit-product-if-exists, vendor/quectel/ec20/device-partial.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.no_modem_board=1

# vendor apps
$(call inherit-product-if-exists, vendor/friendlyelec/apps/device-partial.mk)

BUILD_WITHOUT_VENDOR_APPS := RkApkinstaller RkExplorer RKLogsTool RKUpdateService userExperienceService

# Privileged permissions whitelist
PRODUCT_COPY_FILES += \
    device/rockchip/common/permissions/privapp-permissions-rockchip.xml:system/etc/permissions/privapp-permissions-rockchip.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce

# Disable Scudo to save RAM.
PRODUCT_DISABLE_SCUDO := true

