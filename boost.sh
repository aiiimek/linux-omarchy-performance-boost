#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# Status checker
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[OK]${RESET} $1"
    else
        echo -e "${RED}[ERROR]${RESET} $1"
    fi
}

clear
echo -e "${YELLOW}"
echo ".--------------------------------.";
echo "|  ____   ___   ___  ____ _____  |";
echo "| | __ ) / _ \ / _ \/ ___|_   _| |";
echo "| |  _ \| | | | | | \___ \ | |   |";
echo "| | |_) | |_| | |_| |___) || |   |";
echo "| |____/ \___/ \___/|____/ |_|   |";
echo "|                                |";
echo "'--------------------------------'";
echo -e "${RESET}"

sleep 0.3

echo -e "${YELLOW}Disabling power-profiles-daemon...${RESET}"
sudo systemctl disable --now power-profiles-daemon >/dev/null 2>&1
check_status "power-profiles-daemon disabled"

echo -e "${YELLOW}Setting intel_pstate to passive...${RESET}"
echo passive | sudo tee /sys/devices/system/cpu/intel_pstate/status >/dev/null
check_status "intel_pstate → passive"

echo -e "${YELLOW}Setting CPU governor to performance on all cores...${RESET}"
for CPU in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo performance | sudo tee $CPU >/dev/null
done
check_status "governor → performance"

echo
echo -e "${YELLOW}SUMMARY:${RESET}"

echo -e "${GREEN}Current Governor:${RESET}"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

echo
echo -e "${GREEN}intel_pstate Status:${RESET}"
cat /sys/devices/system/cpu/intel_pstate/status

echo
echo -e "${GREEN}Done! System is now running in PERFORMANCE mode${RESET}"

echo
read -p "Press ENTER to close..."
