
include $(LOCAL_PATH)/ProjectConfig.mk

#Ramdisk 
PRODUCT_COPY_FILES += $(LOCAL_PATH)/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/meta_init.project.rc

# thermal.conf and thermal_eng.conf:with BCCT 
# thermal_NoBCCT.conf and thermal_eng_NoBCCT.conf:no BCCT 
# thermal policy no BCCT
ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal_eng.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
else
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf
endif
PRODUCT_COPY_FILES += $(LOCAL_PATH)/ht120.mtc:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.ht120.mtc


# touch related file for CTS
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml
endif

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp,adb
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6737M

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n370b/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n370b/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6735/ACCDET.kl:system/usr/keylayout/ACCDET.kl
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n370b/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n370b/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n370b/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png

#media_codecs.xml for video codec support
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk_omx_core.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_omx_core.cfg
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# media_profiles.xml for media profile support
PRODUCT_COPY_FILES += device/mediatek/mt6735/media_profiles_mt6735m.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml
PRODUCT_PROPERTY_OVERRIDES += media.settings.xml=/vendor/etc/media_profiles.xml

# F2FS filesystem
# PRODUCT_PROPERTY_OVERRIDES += ro.mtk_f2fs_enable=0

# overlay has priorities. high <-> low.

DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif

ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif

$(call inherit-product, device/mediatek/mt6735/device.mk)
$(call inherit-product-if-exists, vendor/mediatek/libs/n370b/device-vendor.mk)

#A-Go
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#Using Firmware prebuilts form Android Marshmallow
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/catcher_filter_1_lwg_n.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/catcher_filter_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/dsp_1_lwg_n.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/dsp_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/em_filter_1_lwg_n.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/em_filter_1_lwg_n.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/modem_1_lwg_n.img:$(TARGET_COPY_OUT_VENDOR)/firmware/modem_1_lwg_n.img
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/ROMv2_lm_patch_1_0_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/ROMv2_lm_patch_1_0_hdr.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/ROMv2_lm_patch_1_1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/ROMv2_lm_patch_1_1_hdr.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/WMT_SOC.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/WMT_SOC.cfg
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v1_coeff.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v1_coeff.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v1_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v1_patch.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v2_coeff.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v2_coeff.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v2_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v2_patch.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v3_coeff.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v3_coeff.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v3_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v3_patch.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v4_coeff.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v4_coeff.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v4_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v4_patch.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v5_coeff.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v5_coeff.bin
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/firmware/mt6627/mt6627_fm_v5_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt6627/mt6627_fm_v5_patch.bin

#Using prebuilts kernel modules for CONSYS_MT6735
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/bt_drv.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/bt_drv.ko
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/fmradio_drv.ko:$(TARGET_COPY_OUT_VENDOR)lib//modules/fmradio_drv.ko
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/gps_drv.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/gps_drv.ko
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/wlan_drv_gen2.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wlan_drv_gen2.ko
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/wmt_chrdev_wifi.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wmt_chrdev_wifi.ko
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/modules/wmt_drv.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wmt_drv.ko