#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-18 The LineageOS Project
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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),X00P)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

SNAP_LIBS := libarcsoft_beautyshot.so libarcsoft_hdr.so libarcsoft_night_shot.so libarcsoft_panorama_burstcapture.so libjni_hq_beautyshot.so libjni_hq_hdr_shot.so libjni_hq_night_shot.so libjni_hq_panorama.so libjni_imageutil.so libjni_snapcammosaic.so libjni_snapcamtinyplanet.so libmpbase.so libtensorflow_inference.so
SNAP_SYMLINKS := $(addprefix $(TARGET_OUT_APPS_PRIVILEGED)/SnapCam/lib/arm64/,$(notdir $(SNAP_LIBS)))
$(SNAP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SNAP lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SNAP_SYMLINKS)

endif
