#!/system/bin/sh

sleep 60 

# start user init
# activate delayed config to override Kernel
/system/xbin/busybox nohup /system/bin/sh /data/local/userinit.sh 2>&1 >/dev/null &
