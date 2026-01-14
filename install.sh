#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║     Linux Omarchy Performance Boost - Installer          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# Check if running as root (we don't want that)
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}[ERROR]${RESET} Please run this script as a normal user, not root."
    exit 1
fi

INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${YELLOW}[1/4]${RESET} Creating directories..."
mkdir -p "$INSTALL_DIR" "$ICON_DIR" "$APP_DIR"

echo -e "${YELLOW}[2/4]${RESET} Installing boost script..."
cp "$SCRIPT_DIR/boost.sh" "$INSTALL_DIR/boost"
chmod +x "$INSTALL_DIR/boost"

echo -e "${YELLOW}[3/4]${RESET} Installing icon..."
cp "$SCRIPT_DIR/icons/boost.png" "$ICON_DIR/boost.png"

echo -e "${YELLOW}[4/4]${RESET} Installing desktop launcher..."
cat > "$APP_DIR/boost-performance.desktop" << EOF
[Desktop Entry]
Name=Boost Performance
Comment=Force performance CPU governor for maximum speed
Exec=$INSTALL_DIR/boost
Icon=$ICON_DIR/boost.png
Terminal=true
Type=Application
Categories=System;Utility;
Keywords=performance;cpu;boost;speed;governor;
EOF

# Update desktop database if available
update-desktop-database "$APP_DIR" 2>/dev/null

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo -e "${YELLOW}[NOTE]${RESET} ~/.local/bin is not in your PATH."
    echo -e "Add this line to your ~/.bashrc or ~/.zshrc:"
    echo -e "${CYAN}export PATH=\"\$HOME/.local/bin:\$PATH\"${RESET}"
    echo ""
fi

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║              Installation complete!                      ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo -e "You can now:"
echo -e "  ${CYAN}•${RESET} Run ${GREEN}boost${RESET} in terminal"
echo -e "  ${CYAN}•${RESET} Search for ${GREEN}Boost Performance${RESET} in your app launcher"
echo ""
