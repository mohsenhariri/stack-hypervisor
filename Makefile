# https://www.gnu.org/software/make/manual/make.html

VNC_PROXY := ./vnc-client/noVNC/utils/novnc_proxy

vnc-server:
		$(VNC_PROXY) --vnc localhost:$(VNC_PORT) --listen localhost:$(VNC_WEB_PORT)

NET := extnet
VM_NAME := vm1
get-vm-mach:
		virsh dumpxml $(VM_NAME) | grep 'mac address' | awk -F "'" '{print $2}'

get-vm-ip:
		virsh net-dhcp-leases $(NET) | grep $(VM_NAME) | awk '{print $5}'
