# Libvirt Configuration

Libvirt saves configuration in XML files. The default location for these files is `/etc/libvirt/qemu/`.

To see the list of VMs:

``` bash
ls /etc/libvirt/qemu/
```

## Change the user and group

To change the user and group that libvirt uses to run VMs, in `/etc/libvirt/qemu.conf` the following options are set:

``` bash
user = "root"
group = "root"
```

Change these to your user and group.
