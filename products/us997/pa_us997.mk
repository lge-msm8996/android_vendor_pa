# Copyright (C) 2016-2017 Paranoid Android
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

# Check for target product
ifeq (pa_us997,$(TARGET_PRODUCT))

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

# Advanced platform features
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/us997/us997.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_us997
PRODUCT_DEVICE := us997
PRODUCT_MODEL := LG-US997
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE

PRODUCT_GMS_CLIENTID_BASE := android-lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g6" \
    PRODUCT_NAME="lucye_nao_us" \
    BUILD_FINGERPRINT="lge/lucye_nao_us/lucye:7.0/NRD90U/172061549d102:user/release-keys" \
    PRIVATE_BUILD_DESC="lucye_nao_us-user 7.0 NRD90U 172061549d102 release-keys"

include vendor/pa/main.mk

endif
