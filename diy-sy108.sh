#!/bin/sh
# diy-sy108.sh —— feeds 初始化后、编译前执行（build.yml 已预留钩子）
# 仅 main 固件装入第三方 LuCI 界面 zhengmz/luci-app-zerotier
[ "$PROFILE" = "main" ] || exit 0
set -e

if [ ! -d feeds/luci/applications/luci-app-zerotier ]; then
  git clone --depth=1 https://github.com/zhengmz/luci-app-zerotier.git feeds/luci/applications/luci-app-zerotier
fi

./scripts/feeds update -f luci
./scripts/feeds install -p luci -f luci-app-zerotier

echo "::notice::luci-app-zerotier installed for main profile"
