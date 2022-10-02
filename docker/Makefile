d := /usr/bin/docker



start:
		sudo systemctl start docker

# add a condition for checking if a network with this name doesn't exist 
n-create:
		docker network create \
		--driver=bridge \
		--subnet=172.28.0.0/16 \
		--ip-range=172.28.5.0/24 \
		--gateway=172.28.5.254 \
		br0

n-list:
		$(d) network ls


