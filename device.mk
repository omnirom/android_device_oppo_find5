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

# This file includes all definitions that apply to ALL find5 devices, and
# are also specific to find5 devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/oppo/find5/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_COPY_FILES += \
	device/oppo/find5/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
	device/oppo/find5/configs/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
	device/oppo/find5/configs/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/oppo/find5/thermald-find5.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
	device/oppo/find5/configs/init.find5.rc:root/init.find5.rc \
	device/oppo/find5/configs/init.find5.usb.rc:root/init.find5.usb.rc \
	device/oppo/find5/configs/init.recovery.find5.rc:root/init.recovery.find5.rc \
	device/oppo/find5/configs/tpupdate.rle:root/tpupdate.rle \
	device/oppo/find5/configs/fstab.find5:root/fstab.find5 \
	device/oppo/find5/configs/twrp.fstab:recovery/root/etc/twrp.fstab \
	device/oppo/find5/configs/ueventd.find5.rc:root/ueventd.find5.rc \
	device/oppo/find5/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/oppo/find5/configs/media_codecs.xml:system/etc/media_codecs.xml
	
PRODUCT_COPY_FILES += \
	device/oppo/find5/init.qcom.post_fs.sh:system/etc/init.qcom.post_fs.sh \
	device/oppo/find5/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
	device/oppo/find5/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/oppo/find5/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	device/oppo/find5/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	device/oppo/find5/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	device/oppo/find5/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	device/oppo/find5/synaptics-rmi-ts.kl:system/usr/keylayout/synaptics-rmi-ts.kl \
	device/oppo/find5/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	device/oppo/find5/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	device/oppo/find5/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
	device/oppo/find5/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	device/oppo/find5/touch_dev.idc:system/usr/idc/touch_dev.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	device/oppo/find5/configs/gps.conf:system/etc/gps.conf

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFC feature files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
NFCEE_ACCESS_PATH := device/oppo/find5/configs/nfcee_access.xml
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=480

# qcom
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sdk.audio.ssr=false \
	ro.qc.sdk.audio.fluencetype=fluence \
	ro.qc.sdk.sensors.gestures=false

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false \
	af.resampler.quality=4 \
	lpa.decode=false \
	tunnel.decode=false \
	tunnel.audiovideo.decode=true

# Debugging
PRODUCT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	service.adb.enable=1 \
	sys.usb.config=adb \
	ro.debuggable=1 \
	persist.service.adb.enable=1

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable=true

# Cell Broadcasts
PRODUCT_PROPERTY_OVERRIDES += \
	ro.cellbroadcast.emergencyids=0-65534 
        
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960 \
	lights.find5 \
	camera-wrapper.msm8960 \
	power.find5

PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_COPY_FILES += \
	device/oppo/find5/configs/init.find5.bt.sh:system/etc/init.find5.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
        libmm-omxcore \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=0

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sensors.wl_dis=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp \
	ro.adb.secure=0

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# other apps
PRODUCT_PACKAGES += \
	OmniTorch

# selinux - maxwen: disabled for now
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.build.selinux=1 \
#    persist.sys.root_access=1

# SELinux filesystem labels
#PRODUCT_COPY_FILES += \
#    device/oppo/find5/configs/50selinuxrelabel:system/etc/init.d/50selinuxrelabel
	
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

