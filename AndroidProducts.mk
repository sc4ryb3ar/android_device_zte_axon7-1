IS_ARM64 := true

# Include Official OTA Package
WITH_OFFICIALOTA := true

# Support Beta OTA Opt-in (Requires additional ota xml)
BETA_OTA := true

# Get the long list of APNs
PRODUCT_COPY_FILES := $(LOCAL_PATH)/apns-full-conf.xml:system/etc/apns-conf.xml

# Include pure telephony configuration
$(call inherit-product, vendor/pure/configs/pure_phone.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := axon7
PRODUCT_NAME := aosp_axon7
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE A2017U
PRODUCT_MANUFACTURER := ZTE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="P996A01_N" \
    BUILD_FINGERPRINT="ZTE/P996A01_N/ailsa_ii:7.0/NRD90M/20170128.052618:user/release-keys" \
    PRIVATE_BUILD_DESC="P996A01_N-user 7.0 NRD90M 20170128.052618 release-keys"

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# ANT
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libvolumelistener \
    tinymix \
    audio_amplifier.msm8996 \
    audiod \
    audio.primary.msm8996 \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_dtp.xml:system/etc/mixer_paths_dtp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml \
    $(LOCAL_PATH)/audio/mixer_paths_i2s.xml:system/etc/mixer_paths_tasha_i2s.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
		audio.deep_buffer.media=true \
		audio.dolby.ds2.enabled=false \
		audio.dolby.ds2.hardbypass=false \
		audio_hal.period_size=192 \
		audio.offload.buffer.size.kb=64 \
		audio.offload.gapless.enabled=true \
		audio.offload.min.duration.secs=30 \
		audio.offload.multiaac.enable=true \
		audio.offload.multiple.enabled=true \
		audio.offload.passthrough=false \
		audio.offload.pcm.16bit.enable=true \
		audio.offload.pcm.24bit.enable=true \
		audio.offload.track.enable=true \
		audio.offload.video=true \
		audio.safx.pbe.enabled=true \
		media.stagefright.audio.sink=280 \
		persist.audio.fluence.speaker=true \
		persist.audio.fluence.voicecall=true \
		persist.audio.fluence.voicerec=false \
		persist.audio.ssr.3mic=false \
		ro.qc.sdk.audio.fluencetype=fluence \
		ro.qc.sdk.audio.ssr=false \
		tunnel.audio.encode=false \
		use.qti.sw.ape.decoder=true \
		use.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += \
		persist.bt.enableAptXHD=true \
    bt.max.hfpclient.connections=1 \
    qcom.bluetooth.soc=rome \
    ro.bluetooth.emb_wp_mode=true \
    ro.bluetooth.wipower=true

# Busybox v1.26.2-Stericson
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/busybox:system/xbin/busybox

# Camera
PRODUCT_PACKAGES += \
    libshim_camera \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
		frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
		frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
		frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
		frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
		frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
		frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

PRODUCT_PROPERTY_OVERRIDES += \
		persist.camera.gyro.disable=0 \
		persist.camera.preview.ubwc=0 \
		persist.camera.video.ubwc=0 \
		persist.camera.stats.test=5 \
		camera.disable_zsl_mode=1
		#camera2.portability.force_api=1

# Charging
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne \
    services-ext

PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1

# Dex2oat Hacks
PRODUCT_PROPERTY_OVERRIDES += \
		dalvik.vm.dex2oat-swap=false \
		dalvik.vm.dex2oat-flags=--no-watch-dog

# Display
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

PRODUCT_PACKAGES += \
    calib.cfg \
    copybit.msm8996 \
    gralloc.msm8996 \
    hwcomposer.msm8996 \
    libtinyxml \
    memtrack.msm8996 \
    qdcm_calib_data_zteSAM_S6E3HA3_SAM_25601440_5P5Inch.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

PRODUCT_PROPERTY_OVERRIDES += \
		ro.sf.lcd_density=640 \
		debug.egl.hw=1 \
		debug.gralloc.enable_fb_ubwc=1 \
		debug.sf.hw=1 \
		dev.pm.dyn_samplingrate=1 \
		persist.demo.hdmirotationlock=false \
		persist.hwc.enable_vds=1 \
		persist.sys.wfd.virtual=0 \
		ro.opengles.version=196610 \
		ro.qcom.ad=1 \
		ro.qcom.ad.calib.data=/system/etc/calib.cfg \
		ro.qcom.ad.sensortype=2 \
		ro.qualcomm.display.paneltype=1 \
		sdm.debug.disable_rotator_split=1 \
		sdm.perf_hint_window=50

$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

# Doze mode
PRODUCT_PACKAGES += \
    ZTEDoze

# File System
PRODUCT_PACKAGES += \
    fs_config_files

# Fingerprintd
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Gesture Handler
PRODUCT_PACKAGES += \
   GestureHandler

# GPS
PRODUCT_PACKAGES += \
    gps.msm8996 \
    libcurl \
    libgnsspps

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:system/etc/xtwifi.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PROPERTY_OVERRIDES += \
		persist.gps.qc_nlp_in_use=1 \
		persist.loc.nlp_name=com.qualcomm.location \
		ro.gps.agps_provider=1

# Init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.sh \
    ueventd.qcom.rc \
    init.qcom.bt.sh \
    init.recovery.qcom.rc \
    init.msm.usb.configfs.rc \
    init.qcom.usb.rc \
    init.qcom.usb.sh

# IRQ balance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8996

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
		$(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs_dolby.xml:system/etc/media_codecs_dolby.xml \
    $(LOCAL_PATH)/configs/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PROPERTY_OVERRIDES += \
		  media.aac_51_output_enabled=true \
			drm.service.enabled=1 \
	    vidc.debug.perf.mode=2 \
	    vidc.enc.disable.pq=true \
	    vidc.enc.dcvs.extra-buff-count=2

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.nxp.nfc.nq \
    nfc_nci.nqx.default \
    NQNfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

#Partitions
PRODUCT_PROPERTY_OVERRIDES += \
		ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=60 \
		ro.vendor.extension_library=libqti-perfd-client.so \
	  ro.min_freq_0=307200 \
	  ro.min_freq_4=307200

# Power HAL
PRODUCT_PACKAGES += \
	  power.msm8996

# Qualcomm support
PRODUCT_PROPERTY_OVERRIDES += \
	  persist.timed.enable=true

# QMI
PRODUCT_PACKAGES += \
    libjson

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_axon7

# RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

PRODUCT_PROPERTY_OVERRIDES += \
     DEVICE_PROVISIONED=1 \
     persist.data.qmi.adb_logmask=0 \
		 persist.data.mode=concurrent \
     persist.data.netmgrd.qos.enable=true \
     persist.data.df.agg.dl_pkt=10 \
     persist.data.df.agg.dl_size=4096 \
     persist.data.df.dev_name=rmnet_usb0 \
     persist.data.df.dl_mode=5 \
     persist.data.df.iwlan_mux=9 \
     persist.data.df.mux_count=8 \
     persist.data.df.ul_mode=5 \
     persist.data.wda.enable=true \
     persist.dpm.feature=0 \
     persist.net.doxlat=false \
     persist.radio.add_power_save=1 \
     persist.radio.apm_sim_not_pwdn=1 \
     persist.radio.csvt.enabled=false \
     persist.radio.custom_ecc=1 \
     persist.radio.flexmap_type=disabled \
     persist.radio.hw_mbn_update=1 \
     persist.radio.mt_sms_ack=20 \
     persist.radio.multisim.config=dsds \
     persist.radio.sap_silent_pin=true \
     persist.radio.sib16_support=1 \
     persist.radio.start_ota_daemon=0 \
     persist.radio.sw_mbn_openmkt=1 \
     persist.radio.sw_mbn_update=1 \
     persist.radio.sw_mbn_volte=1 \
     persist.rild.nitz_long_ons_0="" \
     persist.rild.nitz_long_ons_1="" \
     persist.rild.nitz_long_ons_2="" \
     persist.rild.nitz_long_ons_3="" \
     persist.rild.nitz_plmn="" \
     persist.rild.nitz_short_ons_0="" \
     persist.rild.nitz_short_ons_1="" \
     persist.rild.nitz_short_ons_2="" \
     persist.rild.nitz_short_ons_3="" \
		 persist.rmnet.data.enable=true \
		 persist.sys.ssr.restart_level=ALL_ENABLE \
		 persist.sys.ztelog.enable=0 \
     rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
     ril.subscription.types=NV,RUIM \
     ro.telephony.call_ring.multiple=false \
     ro.telephony.default_network=10,10 \
		 ro.use_data_netmgrd=true

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8996

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_PROPERTY_OVERRIDES += \
		ro.qti.sensors.dev_ori=false \
		ro.qti.sensors.pmd=false \
		ro.qti.sensors.sta_detect=false \
		ro.qti.sensors.mot_detect=false

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/synaptics_dsx.idc:system/usr/idc/synaptics_dsx.idc \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# USB
PRODUCT_COPY_FILES += \
	  frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
		frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
		frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Wifi
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    wifi_symlinks

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wcnss/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wcnss/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wcnss/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wcnss/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wcnss/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wcnss/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# VR
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml


$(call inherit-product-if-exists, vendor/zte/axon7/axon7-vendor.mk)
