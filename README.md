## Script for install VPN (WireGuard and Outline with Shadowsocks) and software on Ubuntu 18.04 and later. 

Software in this script: Nano, MC, Docker, Docker-compose, Speedtest, Outline with Shadowsocks, WireGuard

### How to install. 
1. Pull script.\
   `git pull https://github.com/stcmsk/vpn.git`
2. Edit script file. 

### Edit strings for WireGuard, need to set server IP (external server IP) and Admin password. 
`nano vpn.sh`  or  `vi vpn.sh`

### Fix this strings: 
`-e WG_HOST=11.22.33.44` - Set in this string youre server IP \
`-e PASSWORD=Enter youre password` - Admin web password, URL for enter in WEB: `http://Youre server IP:51821 `

### 3. Start script. 
`sudo su`\
`bash vpn.sh`

### Outline with Shadowsocks. 
After script finish you will see key, get it and add server in Outline manager for PC. \
Thats all! You can make users, give him keys and use. 
### WireGuard 
After script finish you need to go on the admin WEB for make user keys. \
Go to address http://Youre server IP:51821/ \
Use password what you ser in string ..PASSWORD.. in script. 
### Speedtest 
For test youre internet speed i add in script speedtest. \
Jast enter in command line: `speedtest`

Enjoy! 
