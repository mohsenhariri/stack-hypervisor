virsh list --all
get the list of all machines

virsh list
get the list of running machines

virsh start machineName
virsh start --domain machineName


virsh net-list
get the network list

virsh net-dumpxml networkName
virsh net-dumpxml --network networkName
get the network info dumps to xml

virsh net-info netName

virsh net-dhcp-leases netName

virsh domifaddr machieName


virsh net-create XMLfile
