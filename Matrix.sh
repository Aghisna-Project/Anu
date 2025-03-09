#!/bin/bash

# Array berisi pasangan URL git, branch, dan direktori tujuan
declare -A repos=(
    ["https://github.com/Aghisna-Project/Aghisna_rev -b build"]="kernel/xiaomi/sm6150"
    ["https://github.com/Aghisna-Project/device_xiaomi_sm6150-common -b 15"]="device/xiaomi/sm6150-common"
    ["https://github.com/Aghisna-Project/device_xiaomi_sweet -b 15"]="device/xiaomi/sweet"
    ["https://github.com/Aghisna-Project/vendor_xiaomi_sm6150-common -b 15"]="vendor/xiaomi/sm6150-common"
    ["https://github.com/Aghisna-Project/vendor_xiaomi_sweet -b 15"]="vendor/xiaomi/sweet"
    ["https://github.com/Aghisna-Project/android_hardware_xiaomi -b 15"]="hardware/xiaomi"
    ["https://repo.radio/donjohanliebert/vendor_xiaomi_sweet-miuicamera -b udc"]="vendor/xiaomi/sweet-miuicamera"
)

# Loop untuk meng-clone masing-masing repository ke direktori tujuan
for repo in "${!repos[@]}"; do
    target_dir="${repos[$repo]}"
    
    # Membuat direktori jika belum ada
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
        echo "Direktori $target_dir dibuat."
    fi

    # Masuk ke direktori tujuan
    cd "$target_dir"

    # Melakukan git clone dengan nama direktori target
    git clone $repo .
    echo "Repository $repo telah berhasil di-clone ke $target_dir."
    
    # Kembali ke direktori sebelumnya
    cd -
done
