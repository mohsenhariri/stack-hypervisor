# Network

Libvirt saves network configuration in XML files. The default location for these files is /etc/libvirt/qemu/networks.

`virsh net-define` is used to define a network configuration without starting it, while `virsh net-create` defines and starts the network based on the provided configuration.

`virsh domifaddr vmName` is used to get the IP address of a virtual machine.
