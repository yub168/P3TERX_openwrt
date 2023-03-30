#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#修改 Linux 内核版本
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile

#删除默认安装包
sed -i 's/luci-app-adbyby-plus //g' ./target/linux/x86/Makefile
sed -i 's/lluci-app-ipsec-vpnd //g' ./target/linux/x86/Makefile
sed -i 's/luci-app-unblockmusic //g' ./target/linux/x86/Makefile
sed -i 's/luci-app-zerotier //g' ./target/linux/x86/Makefile
sed -i 's/luci-app-xlnetacc //g' ./target/linux/x86/Makefile
sed -i 's/luci-app-wireguard //g' ./target/linux/x86/Makefile
sed -i 's/luci-app-nlbwmon //g' ./include/target.mk
sed -i 's/luci-app-wol //g' include/target.mk
#sed -i 's/luci-app-nlbwmon //g'

#添加安装包
#sed -i 's/kmod-drm-amdgpu/& store/' ./target/linux/x86/Makefile

# 修改lan口地址
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#修改活动连接数
# 16384 是原来的连接数，65535 是要修改成的连接数
sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

#修改wan口为pppoe 增加拨号账号与密码
sed -i 's/2:-dhcp/2:-pppoe/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i "s/username='username'/username='yub168'/g" package/base-files/files/bin/config_generate
sed -i "s/password='password'/password='yb790913'/g" package/base-files/files/bin/config_generate
