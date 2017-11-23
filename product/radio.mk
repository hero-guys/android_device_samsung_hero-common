# Init Resources
PRODUCT_PACKAGES += \
	init.baseband.rc \
	init.baseband.sh 

# Packages
PRODUCT_PACKAGES += \
	libxml2 \
	rild \
	libreference-ril \
	libril \
	libprotobuf-cpp-full \
	libsecril-client \
	libsecril-client-sap \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	modemloader

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# rild.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/rild.rc:system/vendor/etc/init/rild.rc

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.add_power_save=1 \
	persist.radio.apm_sim_not_pwdn=1 \
	rild.libpath=/system/lib64/libsec-ril.so \
	rild.libpath2=/system/lib64/libsec-ril-dsds.so \
	ro.telephony.default_network=9 \
	ro.telephony.ril_class=SlteRIL \
	ro.ril.gprsclass=10 \
	ro.ril.hsxpa=1 \
	persist.data.netmgrd.qos.enable=false \
	ro.use_data_netmgrd=false \
	ro.ril.telephony.mqanelements=6 \
	telephony.lteOnGsmDevice=1 \
	telephony.lteOnCdmaDevice=0 \
	ro.telephony.get_imsi_from_sim=true \
	ro.ril.force_eri_from_xml=true \
	net.tethering.noprovisioning=true 
