# generate fstab file for device
-include device/rockchip/common/build/rockchip/RebuildFstab.mk

# generate dtbo image for device
-include device/rockchip/common/build/rockchip/RebuildDtboImg.mk

ifeq ($(HAVE_PREBUILT_DTBO),true)
ALL_DEFAULT_INSTALLED_MODULES += $(PRODUCT_OUT)/dtbo.img
endif

# generate parameter.txt for device
-include device/rockchip/common/build/rockchip/RebuildParameter.mk
