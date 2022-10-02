virsh net-list --all
virsh net-info netName
virsh net-dhcp-leases netName
virsh net-dumpxml netName


virsh net-dumpxml netName > netName.xml


To define a network from an XML file:
virsh net-define br1.xml

To start an inactive network:
virsh net-start br1

