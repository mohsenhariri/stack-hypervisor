#!/bin/sh
echo "Number of cores:"
egrep -c '(vmx|svm)' /proc/cpuinfo

echo "KVM acceleration"
# k=$(kvm-ok 2>&1| grep "can be used")
CHK=$(kvm-ok | grep "can be used")
if [[ $CHK=="KVM acceleration can be used" ]]; then
    echo "Checked."
else
    echo "KVM doesn't work."
    exit 1
fi

PKG="qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst"

apt update
apt upgrade
apt install -y $PKG

# cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/

# chown mohsen:${YOURGROUP} ~/.config/libvirt/libvirt.conf

# sudo systemctl disable libvirtd*

# sudo apt purge qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst qemu-system-x86

