# kali-udocker-termux
Run Kali Linux CLI pentesting tools inside Termux using uDocker — includes GUI (VNC), essential tools like nmap, hydra, burpsuite, and all fixes for common errors. One-click installer for noobs.  
-> Lightweight Kali setup for Termux with uDocker (No Root, No Errors)


🚀 Features

Run Kali in Termux (no root)

GUI via VNC Viewer

Includes CLI tools: nmap, hydra, sqlmap, netcat, metasploit-framework etc.

Fixes broken apt, nano, ifconfig, etc.

Lightweight setup (under 6.5GB)



---

⚙️ Requirements

Termux from F-Droid (not Play Store)

Android 8+

Storage: 6.5GB free


---

✅ How to Use

1. Upload this script to your GitHub repo as setup_udocker_kali.sh


2. In Termux, run:



chmod +x setup_udocker_kali.sh
./setup_udocker_kali.sh


---

📌 Notes

Kali Image: We're using kalilinux/kali-rolling, which is the latest rolling Kali Docker image.

No Root Required: udocker works in Termux without needing root access.

Proot Support: Termux + PRoot handles filesystem redirection and sandboxing.

---

📥 Installation (1-Line Setup)
• First Install Udocker and Kali Image

pkg update -y && pkg install -y curl && curl -L https://raw.githubusercontent.com/itachi-uchiha0011/kali-udocker-termux/main/first_this.sh | bash

• Then use these Commands:
udocker run kalilinux/kali-rolling:latest



---

📦 Tools Installed (via kali-tools.txt)

nmap
net-tools
hydra
sqlmap
wget
curl
nano
python3
wireshark-cli
burpsuite


---

🛠️ GUI Setup

Install VNC Viewer (RealVNC or bVNC) and connect to:

localhost:1

Password: kali



---

🧰 Troubleshooting

Check troubleshooting.md for:

apt errors

ifconfig not found

missing GUI

storage full



---

📸 Screenshots

In screenshots/ folder (for every step).


---

👨‍💻 Maintainer

Built with ❤️ by Itachi Uchiha
