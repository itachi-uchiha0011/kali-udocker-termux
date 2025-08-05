#!/bin/bash

echo "---------------------------------------------"
echo " 🛠️  Kali Pentest Setup for udocker (CLI + GUI)"
echo "---------------------------------------------"
echo ""
read -p "🔸 Do you want FULL install (3+ GB) or LITE version (1.5 GB)? [full/lite]: " MODE

echo "[*] Updating system..."
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list
apt update && apt upgrade -y

echo "[*] Installing essential CLI OS utilities..."
apt install -y net-tools iproute2 procps inetutils-ping dnsutils traceroute \
  neofetch lsb-release lsof file htop unzip zip tar curl wget nano vim bash-completion tree

echo "[*] Installing privacy & anonymity tools..."
apt install -y tor torsocks proxychains4 macchanger gpg secure-delete wipe whois

echo "[*] Setting up proxychains to use Tor..."
sed -i 's/socks4 127.0.0.1 9050/socks5 127.0.0.1 9050/' /etc/proxychains.conf

echo "[*] Installing Python support tools..."
apt install -y python3 python3-pip && pip3 install pwntools

echo "[*] Installing tshark (CLI version of Wireshark)..."
apt install -y tshark

echo "[*] Installing wordlists..."
apt install -y seclists wordlists
ln -s /usr/share/wordlists/rockyou.txt.gz ~/rockyou.txt.gz
gunzip ~/rockyou.txt.gz

if [ "$MODE" = "full" ]; then
  echo "[*] Installing FULL pentesting suite (heavy tools)..."
  apt install -y \
    nmap netcat-openbsd tcpdump telnet socat nikto whatweb wafw00f dirb gobuster ffuf \
    sqlmap hydra john medusa aircrack-ng bettercap \
    lynis chkrootkit binwalk steghide exiftool hashcat strings \
    metasploit-framework enum4linux smbclient nbtscan wfuzz cewl dnsenum fierce \
    zaproxy burpsuite
else
  echo "[*] Installing LITE pentesting suite (essential tools only)..."
  apt install -y nmap netcat-openbsd sqlmap hydra nikto gobuster ffuf
fi

echo ""
read -p "🔹 Do you want to install XFCE GUI (VNC access)? [y/n]: " GUI
if [ "$GUI" = "y" ]; then
  echo "[*] Installing XFCE + TightVNC..."
  apt install -y xfce4 xfce4-goodies tightvncserver dbus-x11 xterm
  echo "[*] Starting VNC server on port 5901 (use VNC Viewer)..."
  vncserver :1
  echo "🖥️  Connect to localhost:5901 with VNC Viewer (password required)."
fi

echo ""
read -p "🔹 Do you want to EXPORT this container for backup? [y/n]: " BACKUP
if [ "$BACKUP" = "y" ]; then
  echo "[*] Please exit this shell and run:"
  echo "    udocker export kali > kali-backup.tar"
fi

echo ""
echo "✅ Setup Complete!"
echo "🧪 Test tools: ifconfig, neofetch, sqlmap, nmap, tshark, proxychains curl ifconfig.me"
echo "🌐 To anonymize: 'proxychains4 nmap ...' or 'torsocks curl <url>'"
