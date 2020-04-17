#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7b0ad5a9957a394095d435fbb5240a55391bca59; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:804da9d3667bef8320dfb66eca4c824dad73d225 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7b0ad5a9957a394095d435fbb5240a55391bca59 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
