# https://www.gnu.org/software/make/manual/make.html

VNC_PROXY := ./vnc-client/noVNC/utils/novnc_proxy
NET := extnet

%:
	@:

vnc-server:
		$(VNC_PROXY) --vnc localhost:$(VNC_PORT) --listen localhost:$(VNC_WEB_PORT)

# make get-mac vmName 
# make get-mac vm-remote
get-mac:
		@virsh dumpxml $(filter-out $@,$(MAKECMDGOALS)) | grep 'mac address' | awk -F "'" '{print $$2}'

# make get-ip vmHostName
# make get-ip vmhost=host-vm-remote
get-ip:
		@virsh net-dhcp-leases $(NET) | grep $(vmhost) | awk '{print $$5}'
		@virsh net-dhcp-leases $(NET) | grep $(vmhost) | awk '{split($$5, arr, "/"); print arr[1]}'

# make ssh-vm vm=vmName user=userName
# make ssh-vm vm=vm-remote user=remote
ssh-vm: 
		ssh $(user)@$(IP)

ssh-vm: HOSTNAME := $(shell virsh domhostname  $(vm))
ssh-vm:	IP := $(shell virsh net-dhcp-leases $(NET) | grep $(HOSTNAME) | awk '{split($$5, arr, "/"); print arr[1]}')
