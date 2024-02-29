## Script for install VPN WireGuard, Outline (Shadowsocks) and some software on Ubuntu 18.04 and later.
## Software in this script: Nano, Midnight Commander, Docker, Docker Compose, Speedtest, Outline (Shadowsocks), WireGuard and other
## https://github.com/stcmsk/vpn.git

## How to install read README.md

#!/bin/bash

apt update -y \
&& apt upgrade -y \
&& apt install coreutils lsb-release sudo curl gnupg nano mc -y \
&& curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash \
&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
&& curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
&& echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& apt update -y \
&& apt install apt-transport-https ca-certificates docker-ce docker-ce-cli containerd.io speedtest -y \
&& chmod +x /usr/local/bin/docker-compose \
&& ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
&& docker run -d \
--name=wg-easy \
-e WG_HOST=11.22.33.44 \  ## Server IP   
-e PASSWORD=Enter youre password \ ## Admin web password, URL for enter in WEB: http://Server IP:51821/
-v ~/.wg-easy:/etc/wireguard \
-p 51820:51820/udp \
-p 51821:51821/tcp \
--cap-add=NET_ADMIN \
--cap-add=SYS_MODULE \
--sysctl="net.ipv4.conf.all.src_valid_mark=1" \
--sysctl="net.ipv4.ip_forward=1" \
--restart unless-stopped \
ghcr.io/wg-easy/wg-easy \
&& docker ps -a \
&& sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)" \   ## Install Outline with Shadowsocks
&& ls

