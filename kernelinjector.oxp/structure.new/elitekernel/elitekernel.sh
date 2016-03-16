#!/system/bin/sh

# EliteKernel: deploy modules and misc files
mount -o remount,rw /system
chmod -R 0644 /system/lib/modules/
cp -fR /modules/*  /system/lib/modules/
chmod -R 0644 /system/lib/modules
chown 0:0 /system/lib/modules/*

# make sure init.d is ok
chmod -R 775 /system/etc/init.d
chown 0:2000 /system/etc/init.d/*
mount -o remount,ro /system
sync

# force insert modules that are required
insmod /system/lib/modules/bcmdhd.ko
insmod /system/lib/modules/baseband_xmm_power2.ko
insmod /system/lib/modules/raw_ip_net.ko
insmod /system/lib/modules/baseband_usb_chr.ko
insmod /system/lib/modules/cdc_acm.ko
insmod /system/lib/modules/exfat.ko
insmod /system/lib/modules/ntfs.ko
touch /data/local/em_modules_deployed

# activate delayed config to override ROM
/system/xbin/busybox nohup /system/bin/sh /elitekernel/elitekernel_delayed.sh 2>&1 >/dev/null &


