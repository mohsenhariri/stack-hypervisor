# stack-hypervisor

<code> .env </code> should include iso and virtual drive path

- ROOT_ISOS=/media/mohsen/Arc/libvirt/isos
- ROOT_IMAGES=/media/mohsen/Arc/libvirt/images

## QEMU
QEMU provides emulated devices that interpret a guest's instructions using the host's hardware.

QEMU can emulate a variety of guest architectures, including x86, ARM, SPARC, and PowerPC.

## KVM
The Kernel-based Virtual Machine allows a Linux host to become a Type 1 hypervisor.


## Libvirt
Libvirt makes working with individual guests and resources easier than doing so manually.


### Virsh
The virtual shell, `virsh`, is a command-line tool for managing guests and their resources.



- Paravirtualization allows us to use VirtIO to speed up many interactions with host hardware.

- KVM allows QEMU to use paravirtualized hardware.

- Virtualized I/O or VirtIO uses paravirtualization to speed up a guest's communication with host hardware.

- Libvirt provides an API for working with hypervisors and guest configurations.



## Installation

### Install libvirt

``` bash
sudo apt install libvirt-bin
```

### Install qemu

``` bash
sudo apt install qemu-kvm
```

### Install virt-install

``` bash
sudo apt install virtinst
```

`qemu-kvm` and `libvirt-bin` should be started automatically on boot. If not, run the following commands:

``` bash
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
```

to disable:

``` bash
sudo systemctl disable libvirtd.service
sudo systemctl stop libvirtd.service
```

## Usage

`qemu-kvm` is used to run virtual machines. `libvirt-bin` is used to manage virtual machines.

`libvirt-daemon-system` 

`virtinst` includes `virt-install` which is used to create virtual machines. 

## Packages

### virtinst

This package contains some command line utilities to create and edit virtual machines:

- virt-install: provision operating systems into new virtual machines

- virt-clone: cloning existing inactive guests; it copies the disk images,
   and defines a config with new name, UUID and MAC address pointing to the
   copied disks

- virt-xml: easily edit libvirt domain XML using virt-install's command line
   options