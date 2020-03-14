#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0bc61cb0dd38a4aa93484cb78b5425ed68c37a00; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:a285fa2a0c89d22141a9de1962f3c8f6dc474687 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0bc61cb0dd38a4aa93484cb78b5425ed68c37a00 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
