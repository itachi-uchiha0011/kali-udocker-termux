#!/bin/bash

# Author: Itachi Uchiha 
# Description: Install uDocker, pull Kali Linux image, and provide basic usage commands.

set -e

echo "📦 Updating system packages..."
pkg update -y && pkg upgrade -y

echo "⚙️ Installing required dependencies..."
pkg install -y curl wget proot tar git python

echo "🐳 Installing uDocker..."
pip install udocker --break-system-packages

echo "✅ uDocker installed successfully!"
udocker version

echo "📥 Pulling Kali Linux minimal image..."
udocker pull kalilinux/kali-rolling

echo "🎉 Kali Linux image pulled. Listing images..."
udocker images

echo ""
echo "📚 USEFUL uDocker COMMANDS:"
echo "--------------------------------------"
echo "📦 List all udocker containers:"
echo "  udocker ps"

echo "📁 List all pulled images:"
echo "  udocker images"

echo "🚀 Create a new container from image:"
echo "  udocker create --name=kali kali-linux/kali-rolling"

echo "▶️ Run the Kali container:"
echo "  udocker run --user=root -i kali"

echo "🛠️  Install basic tools inside container (after entering):"
echo "  apt update && apt install -y net-tools iputils-ping curl wget nano"

echo "🗑️  Delete container:"
echo "  udocker rm kali"

echo "📦 Remove image:"
echo "  udocker rmi kali-linux/kali-rolling"

echo ""
echo "✅ Done! Use 'udocker run' to start hacking 🔥"
