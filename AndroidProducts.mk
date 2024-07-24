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

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/nanopi5/nanopi5.mk \
    $(LOCAL_DIR)/nanopi5_box/nanopi5_box.mk \
    $(LOCAL_DIR)/rk3566_sgo/rk3566_sgo.mk \
    $(LOCAL_DIR)/rk3566_32bit/rk3566_32bit.mk \
    $(LOCAL_DIR)/rk3566_r/rk3566_r.mk \
    $(LOCAL_DIR)/rk3566_s/rk3566_s.mk \
    $(LOCAL_DIR)/rk3568_s/rk3568_s.mk \
    $(LOCAL_DIR)/rk3566_eink/rk3566_eink.mk \
    $(LOCAL_DIR)/rk3566_einkw6/rk3566_einkw6.mk

COMMON_LUNCH_CHOICES := \
    nanopi5-userdebug \
    nanopi5-user \
    nanopi5_box-userdebug \
    nanopi5_box-user \
    rk3566_32bit-userdebug \
    rk3566_32bit-user \
    rk3566_sgo-userdebug \
    rk3566_sgo-user \
    rk3566_r-userdebug \
    rk3566_r-user \
    rk3566_s-userdebug \
    rk3566_s-user \
    rk3568_s-userdebug \
    rk3568_s-user \
    rk3566_eink-userdebug \
    rk3566_eink-user \
    rk3566_einkw6-userdebug \
    rk3566_einkw6-user

