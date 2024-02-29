#!/bin/bash

vendor=1532
product=007d
state=disabled

DEVICES=/sys/bus/usb/devices

for a in `ls $DEVICES`; do
  if [ -f "$DEVICES/$a/idVendor" -a -f "$DEVICES/$a/idProduct" ]; then
    idVendor=`cat "$DEVICES/$a/idVendor"`
    idProduct=`cat "$DEVICES/$a/idProduct"`
    if [ -f "$DEVICES/$a/product" ]; then 
      productName=`cat "$DEVICES/$a/product"`
    fi
    WAKEUPFILE="$DEVICES/$a/power/wakeup"
    if [ $idVendor = $vendor -a $idProduct = $product -a -f "$WAKEUPFILE" ]; then
      oldState=`cat "$WAKEUPFILE"`
      echo "$state" > "$WAKEUPFILE"
      newState=`cat "$WAKEUPFILE"`
      echo Bus-port:$a vendor=$idVendor product=$idProduct name=$productName WakeUp: old=$oldState new=$newState
    fi
  fi
done
