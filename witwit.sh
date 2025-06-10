
#!/bin/bash
set -e

# Menentukan direktori utama skrip (/inf)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Direktori utama: $SCRIPT_DIR"

# Pindah ke direktori utama
cd "$SCRIPT_DIR"

echo "clean direktori befor clone dt"
rm -rf "$SCRIPT_DIR/hardware/xiaomi"
rm -rf "$SCRIPT_DIR/kernel/xiaomi/sm6150"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sweet-miuicamera"
rm -rf "$SCRIPT_DIR/device/xiaomi/sm6150-common"
rm -rf "$SCRIPT_DIR/device/xiaomi/sweet"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sm6150-common"
rm -rf "$SCRIPT_DIR/vendor/xiaomi/sweet"

echo "clone device tree"
sleep 5
git clone --depth=1 https://github.com/Aghisna-Project/android_hardware_xiaomi.git "$SCRIPT_DIR/hardware/xiaomi"
git clone --depth=1 https://github.com/Aghisna-Project/Vantom_barnul_sm6150.git "$SCRIPT_DIR/kernel/xiaomi/sm6150"
git clone --depth=1 https://gitea.com/RooGhz720/leica-sweet.git "$SCRIPT_DIR/vendor/xiaomi/sweet-miuicamera"
git clone --depth=1 https://gitea.com/RooGhz720/device_xiaomi_sm6150-common.git -b 15-wit "$SCRIPT_DIR/device/xiaomi/sm6150-common"
git clone --depth=1 https://gitea.com/RooGhz720/device_xiaomi_sweet.git -b 15-wit "$SCRIPT_DIR/device/xiaomi/sweet"
git clone --depth=1 https://gitea.com/RooGhz720/vendor_xiaomi_sm6150-common.git "$SCRIPT_DIR/vendor/xiaomi/sm6150-common"
git clone --depth=1 https://gitea.com/RooGhz720/vendor_xiaomi_sweet.git "$SCRIPT_DIR/vendor/xiaomi/sweet"

echo "Semua proses selesai."
