#!/bin/sh

virt-install \
  --name ubuntu1804 \
  --ram 2048 \
  --disk path=/media/mohsen/Arc/libvirt/images/u19.qcow2,size=8 \
  --vcpus 2 \
  --os-type linux \
  --os-variant generic \
  --console pty,target_type=serial \
  --cdrom /media/mohsen/Arc/libvirt/iso/ubuntu-22.04-desktop-amd64.iso