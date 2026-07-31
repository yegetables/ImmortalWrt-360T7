#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.6.1/192.168.6.121/g' package/base-files/files/bin/config_generate

# Modify hostname
TODAY=$(TZ='Asia/Shanghai' date +%Y%m%d) && sed -i "s/hostname='ImmortalWrt'/hostname='360t7m-24.10-6.6'/" package/base-files/files/bin/config_generate
# TODAY=$(TZ='Asia/Shanghai' date +%Y%m%d) && sed -i "s/hostname='ImmortalWrt'/hostname='ImmortalWrt-24.10-6.6-${TODAY}'/" package/base-files/files/bin/config_generate

# Modify filename, add date prefix
TODAY=$(TZ='Asia/Shanghai' date +%Y%m%d) && sed -i 's|IMG_PREFIX:=|IMG_PREFIX:=${TODAY}-24.10-6.6-|' include/image.mk

sed -i 's/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION="ImmortalWrt By yegetables $(date +%Y%m%d)"/g' ./package/base-files/files/etc/openwrt_release

# Insert two lines before the last line in 99-default-settings-chinese. For Modify opkg url, change mt7981 to filogic, del lines inlude passwall.
# filesDAFA sed -i '/^exit 0$/i sed -i "s,mt7981,filogic,g" "package/base-files/files/etc/opkg/distfeeds.conf"\nsed -i '\''/passwall/d'\'' "package/base-files/files/etc/opkg/distfeeds.conf"' package/emortal/default-settings/files/99-default-settings-chinese

# # nikki冲突 
# rm -rf  feeds/smpackage/luci-app-fchomo

# # KMS use packages/net/vlmcds
# rm -rf  feeds/smpackage/vlmcsd
# cp -r feeds/packages/net/vlmcsd package/

# # ddns
# rm -rf feeds/packages/net/ddns-go
# rm -rf feeds/luci/applications/luci-app-ddns-go

# # netspeedtest
# rm -rf feeds/packages/net/speedtest-cli

# # natmap
# rm -rf  feeds/luci/applications/luci-app-natmap 
# rm -rf  feeds/smpackage/luci-app-natmap 

# # 删除自带 mosdns
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/smpackage/luci-app-mosdns

# # 删除自带smartdns
# rm -rf feeds/smpackage/luci-app-smartdns
# rm -rf feeds/smpackage/smartdns
# rm -rf feeds/luci/applications/luci-app-smartdns
# rm -rf feeds/packages/net/smartdns
# git clone --depth=1 https://github.com/lwb1978/openwrt-smartdns  feeds/packages/net/smartdns
# git clone --depth=1 https://github.com/pymumu/luci-app-smartdns  feeds/luci/applications/luci-app-smartdns
# ./scripts/feeds install -f -p luci luci-app-smartdns
# ./scripts/feeds install -f -p packages smartdns


# # new application
# rm -rf package/luci-app-natmapt
# rm -rf package/openwrt-natmapt
# git clone --depth=1 https://github.com/yegetables/luci-app-natmapt.git  package/luci-app-natmapt
# git clone --depth=1 https://github.com/yegetables/openwrt-natmapt.git  package/openwrt-natmapt

# rm -rf package/luci-app-fakehttp
# rm -rf package/openwrt-fakehttp
# git clone --depth=1 https://github.com/yingziwu/openwrt-fakehttp package/openwrt-fakehttp
# git clone --depth=1 https://github.com/yingziwu/luci-app-fakehttp package/luci-app-fakehttp
