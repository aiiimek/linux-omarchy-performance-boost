#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║     Linux Omarchy Performance Boost - Uninstaller        ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"

echo -e "${YELLOW}[1/3]${RESET} Removing boost script..."
rm -f "$INSTALL_DIR/boost"

echo -e "${YELLOW}[2/3]${RESET} Removing icon..."
rm -f "$ICON_DIR/boost.png"

echo -e "${YELLOW}[3/3]${RESET} Removing desktop launcher..."
rm -f "$APP_DIR/boost-performance.desktop"

# Update desktop database if available
update-desktop-database "$APP_DIR" 2>/dev/null

echo ""
echo -e "${GREEN}Uninstallation complete!${RESET}"
echo ""
