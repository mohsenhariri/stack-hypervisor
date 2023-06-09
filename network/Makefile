VIRSH = /usr/bin/virsh

%:
	@:

virsh-net-list:
	$(VIRSH) net-list --all

virsh-net-info:
	$(VIRSH) net-info $(filter-out $@,$(MAKECMDGOALS))

virsh-net-dhcp-leases:
	$(VIRSH) net-dhcp-leases $(filter-out $@,$(MAKECMDGOALS))

virsh-net-dhcp-leases-domain:
	$(VIRSH) net-dhcp-leases $(filter-out $@,$(MAKECMDGOALS)) | grep $(filter-out $@,$(MAKECMDGOALS))

virsh-net-start:
	$(VIRSH) net-start $(filter-out $@,$(MAKECMDGOALS))

virsh-net-destroy:
	$(VIRSH) net-destroy $(filter-out $@,$(MAKECMDGOALS))

virsh-net-undefine:
	$(VIRSH) net-undefine $(filter-out $@,$(MAKECMDGOALS))

virsh-net-dumpxml:
	$(VIRSH) net-dumpxml $(filter-out $@,$(MAKECMDGOALS)) 

virsh-net-dumpxml-save:
	$(VIRSH) net-dumpxml $(filter-out $@,$(MAKECMDGOALS)) > $(filter-out $@,$(MAKECMDGOALS)).xml

virsh-net-create:
	$(VIRSH) net-create --file $(filter-out $@,$(MAKECMDGOALS))


NET := extnet
VM_NAME := vm1
get-vm-mach:
		virsh dumpxml $(VM_NAME) | grep 'mac address' | awk -F "'" '{print $2}'

get-vm-ip:
		virsh net-dhcp-leases $(NET) | grep $(VM_NAME) | awk '{print $5}'
