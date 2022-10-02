# stack-hypervisor



virsh shutdown vmName
virsh destroy vmName



virsh dumpxml vmName

virsh dumpxml vmName > vmName.xml


delete a machine

virsh dumpxml vmName | grep 'source file'
virsh shutdown vmName (or if it doesn't respond: virsh destroy vmName)
virsh undefind vmName
rm /source/file/path





virt-install \
-n myRHELVM1 \
--description "Test VM with RHEL 6" \
--os-type=Linux \
--os-variant=rhel6 \
--ram=2048 \
--vcpus=2 \
--disk path=/var/lib/libvirt/images/myRHELVM1.img,bus=virtio,size=10 \
--graphics none \
--cdrom /var/rhel-server-6.5-x86_64-dvd.iso \
--network bridge:br0