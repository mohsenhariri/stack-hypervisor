# https://www.gnu.org/software/make/manual/make.html
include .env
export

VIRSH = /usr/bin/virsh
VIRT_INSTALL := /usr/bin/virt-install
VIRT_CLONE := /usr/bin/virt-clone
VIRT_VIEWER := /usr/bin/virt-viewer

%:
	@:

# Handling VMs, virsh

virsh-vm-all:
		$(VIRSH) list --all

virsh-vm-start-1:
		if [ -z $$VM_NAME ]; then \
			read -p "Enter the name of the VM: " VM_NAME; \
		fi; \
		$(VIRSH) start $$VM_NAME

virsh-vm-start:
		$(VIRSH) start $(filter-out $@,$(MAKECMDGOALS))

virsh-vm-stop:
		$(VIRSH) shutdown $(VM_NAME)

virsh-vm-reboot:
		$(VIRSH) reboot $(VM_NAME)

virsh-vm-destroy:
		$(VIRSH) destroy $(VM_NAME)

virsh-vm-undefine:
		$(VIRSH) undefine $(VM_NAME)

virsh-vm-undefine-all:
		$(VIRSH) undefine --all

virsh-vm-dumpxml:
		$(VIRSH) dumpxml $(VM_NAME)

virsh-vm-autostart:
		$(VIRSH) autostart $(VM_NAME)

virsh-vm-dominfo:
		$(VIRSH) dominfo $(VM_NAME)

virsh-vm-snapshot-list:
		$(VIRSH) snapshot-list $(VM_NAME)

virsh-vm-snapshot-create:
		$(VIRSH) snapshot-create-as --domain $(VM_NAME) --name $(SNAPSHOT_NAME) --description $(SNAPSHOT_DESCRIPTION)


# VMs, virt-install

VM0 := vm-deb1
NET := extbr

virt-install:
		$(VIRT_INSTALL) \
			--name $(VM0) \
			--os-variant debian10 \
			--memory 2048 \
			--vcpus 2 \
			--network bridge:$(NET) \
			--disk path="$(STORAGE)/$(VM0).qcow2",size=20 \
			--cdrom "$(ISO)/debian-bookworm-DI-rc4-amd64-netinst.iso" \
			--graphics spice 

virt-install-vnc:
		$(VIRT_INSTALL) \
			--name $(VM0) \
			--os-variant debian10 \
			--memory 2048 \
			--vcpus 2 \
			--network bridge:$(NET) \
			--disk path="$(STORAGE)/$(VM0).qcow2",size=20 \
			--cdrom "$(ISO)/debian-bookworm-DI-rc2-amd64-netinst.iso" \
			--graphics vnc,password=$(VNC_PASSWD),port=$(VNC_PORT)

# Clone VMs

VM_ORIGINAL := vm-deb1
VM_NAME := vm-deb2
clone:
		$(VIRT_CLONE) --original $(VM_ORIGINAL) --name $(VM_NAME) --file $(STORAGE)/$(VM_NAME).qcow2

clone-debug:
		$(VIRT_CLONE) --print-xml --debug --original $(VM_ORIGINAL) --name $(VM_NAME) --file $(STORAGE)/$(VM_NAME).qcow2

clone-auto:
		$(VIRT_CLONE) --original $(VM_ORIGINAL) --name $(VM_NAME) --auto-clone

# View VMs

virt-viewer:
		$(VIRT_VIEWER) $(VM_NAME)