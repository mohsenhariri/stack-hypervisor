#!/bin/bash
source .env
VM0="vm-remote"
NET="extbr"

# virsh net-create --file ../network/extnet_recipe.xml

virt-install \
    --name "$VM0" \
    --os-variant debian10 \
    --memory 2048 \
    --vcpus 2 \
    --network bridge:"$NET" \
    --disk path="$STORAGE/$VM0.qcow2",size=15 \
    --cdrom "$ISO/debian-12.0.0-amd64-netinst.iso" \
    --graphics spice

VM_NAMES=("vm-user1" "vm-user2" "vm-user3")

for vm_name in "${VM_NAMES[@]}"; do
    virt-clone \
        --original "$VM0" \
        --name "$vm_name" \
        --file "$STORAGE/$vm_name.qcow2"
done
