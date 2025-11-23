#  Linux Omarchy Performance Boost

![Shell](https://img.shields.io/badge/language-shell-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/build-passing-brightgreen)
![Platform](https://img.shields.io/badge/platform-Linux-yellow)

A minimal, clean and effective performance-boosting script for Linux (especially Hyprland / Wayland setups).  
It disables system-level power saving and forces the CPU into **PERFORMANCE mode** for better responsiveness.

---

## Features

- Forces CPU governor → **performance**
- Sets `intel_pstate` → passive
- Disables `power-profiles-daemon`
- Colorful, clean CLI output
- ASCII-art header
- Error checking for each step
- Ready `.desktop` launcher support
- Fully XDG-compliant installation


## 🖼️ Screenshot


![screenshot](./assets/screenshot-boost.png)





## Installation

Clone the repo:

```bash
git clone https://github.com/YOURNAME/linux-omarchy-performance-boost
cd linux-omarchy-performance-boost

Install the script:

mkdir -p ~/.local/bin
cp boost.sh ~/.local/bin/boost
chmod +x ~/.local/bin/boost

Test:
boost


Install the App Launcher (Walker, Wofi, Anyrun, KDE, GNOME)

Install the icon:

mkdir -p ~/.local/share/icons
cp icons/boost.png ~/.local/share/icons/boost.png


Install the launcher:

cp .desktop/boost-performance.desktop ~/.local/share/applications/


Optional refresh:

update-desktop-database ~/.local/share/applications 2>/dev/null


Now open your launcher (Super + Space in Walker) and type:

Boost Performance