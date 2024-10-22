#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon;master' >> feeds.conf.default
echo 'src-git argon_config https://github.com/jerrykuku/luci-app-argon-config;master' >> feeds.conf.default

# Linux DVB driver for NERC DTV (CY68013A+HDIC HD2312) DTMB/DMB-TH USB adapter
HD2312="$(pwd)/hd2312"
git clone --depth 1 --branch master https://github.com/hanwckf/hd2312.git $HD2312

cat $HD2312/openwrt/dvb-kconfig >> target/linux/generic/config-[0-9].[0-9]*
cp $HD2312/openwrt/dvb.mk package/kernel/linux/modules/

mkdir package/hd2312
cp $HD2312/openwrt/Makefile package/hd2312/

