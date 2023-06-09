#!/usr/bin/bash
source ../.env

# Clone noVNC from github
if [ ! -d "noVNC" ]; then
    git clone git@github.com:novnc/noVNC.git
fi


# Clone websockify from github
if [ ! -d "websockify" ]; then
    git clone git@github.com:novnc/websockify.git
fi

# Run noVNC proxy server
./noVNC/utils/novnc_proxy --vnc localhost:$VNC_PORT --listen localhost:$VNC_WEB_PORT

# SSH port forwarding on the client side
# ssh -L 3000:localhost:6081 -N -f -l <username> <server_ip>
ssh -L $(LOCAL_PORT):localhost:$(VNC_WEB_PORT) -N -f <ssh_name>

