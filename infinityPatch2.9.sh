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
git clone https://github.com/LineageOS/android_packages_apps_Twelve.git -b lineage-22.2 "$SCRIPT_DIR/packages/apps/Twelve"
git clone https://github.com/LineageOS/android_packages_apps_Etar.git -b lineage-22.2 "$SCRIPT_DIR/packages/apps/Etar"
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

echo "Semua proses selesai."
