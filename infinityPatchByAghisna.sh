#!/bin/bash
set -e

# Menentukan direktori utama skrip (/inf)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Direktori utama: $SCRIPT_DIR"

# PATCH_URL="https://raw.githubusercontent.com/Aghisna-Project/Anu/main/0001-add-back-etar-and-twelve.patch"
# PATCH_FILE="0001-add-back-etar-and-twelve.patch"
# PATCH_DEST="$SCRIPT_DIR/vendor/extras/config/$PATCH_FILE"

# Pindah ke direktori utama
cd "$SCRIPT_DIR"

echo "clean direktori"
rm -rf "$SCRIPT_DIR/packages/apps/Calendar"
rm -rf "$SCRIPT_DIR/vendor/extras"
rm -rf "$SCRIPT_DIR/hardware/xiaomi"

sleep 5

echo "Cloning aplikasi"
git clone https://github.com/LineageOS/android_packages_apps_Twelve.git -b lineage-22.1 "$SCRIPT_DIR/packages/apps/Twelve"
git clone https://github.com/LineageOS/android_packages_apps_Etar.git -b lineage-22.1 "$SCRIPT_DIR/packages/apps/Etar"
git clone https://github.com/Aghisna-Project/vendor_extras.git -b 15 "$SCRIPT_DIR/vendor/extras"

# echo "Mengunduh patch..."
# curl -L -o "$PATCH_FILE" "$PATCH_URL"
# mv "$PATCH_FILE" "$PATCH_DEST"

echo "Clone dan download patch selesai. Revert ikon dimulai..."

cd "$SCRIPT_DIR/packages/apps/Messaging"
git reset --hard HEAD~2

cd "$SCRIPT_DIR/packages/apps/Dialer"
git reset --hard HEAD~1

cd "$SCRIPT_DIR/packages/apps/Contacts"
git reset --hard HEAD~1

echo "clean direktori befor clone dt"
rm -rf "$SCRIPT_DIR/hardware/xiaomi"
rm -rf "$SCRIPT_DIR/kernel/xiaomi/sm6150"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sweet-miuicamera"
rm -rf "$SCRIPT_DIR/device/xiaomi/sm6150-common"
rm -rf "$SCRIPT_DIR/device/xiaomi/sweet"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sm6150-common"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sweet"

echo "clone device tree"
sleep 10
git clone --depth=1 https://github.com/Aghisna-Project/android_hardware_xiaomi.git -b 15-new "$SCRIPT_DIR/hardware/xiaomi"
git clone --depth=1 https://github.com/Aghisna-Project/Vantom_barnul_sm6150.git "$SCRIPT_DIR/kernel/xiaomi/sm6150"
git clone --depth=1 https://gitea.com/RooGhz720/leica-sweet.git "$SCRIPT_DIR/vendor/xiaomi/sweet-miuicamera"
git clone --depth=1 https://gitea.com/RooGhz720/device_xiaomi_sm6150-common.git -b 15 "$SCRIPT_DIR/device/xiaomi/sm6150-common"
git clone --depth=1 https://gitea.com/RooGhz720/device_xiaomi_sweet.git -b 15-new "$SCRIPT_DIR/device/xiaomi/sweet"
git clone --depth=1 https://gitea.com/RooGhz720/vendor_xiaomi_sm6150-common.git "$SCRIPT_DIR/vendor/xiaomi/sm6150-common"
git clone --depth=1 https://gitea.com/RooGhz720/vendor_xiaomi_sweet.git "$SCRIPT_DIR/vendor/xiaomi/sweet"

echo "Semua proses selesai."
