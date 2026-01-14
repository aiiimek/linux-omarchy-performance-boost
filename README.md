# Linux Omarchy Performance Boost

![Shell](https://img.shields.io/badge/language-shell-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/build-passing-brightgreen)
![Platform](https://img.shields.io/badge/platform-Linux-yellow)

A minimal, clean and effective performance-boosting script for Linux (especially Hyprland / Wayland setups).  
It disables system-level power saving and forces the CPU into **PERFORMANCE mode** for better responsiveness.

## Features

- Forces CPU governor → **performance**
- Sets `intel_pstate` → passive
- Disables `power-profiles-daemon`
- Colorful, clean CLI output
- ASCII-art header
- Error checking for each step
- Ready `.desktop` launcher support
- Fully XDG-compliant installation

## Screenshot

![screenshot](./assets/screenshot-boost.png)

---

## Quick Install (One Command)

```bash
git clone https://github.com/aimek/linux-omarchy-performance-boost.git && cd linux-omarchy-performance-boost && chmod +x install.sh && ./install.sh
```

**Or step by step:**

```bash
git clone https://github.com/aimek/linux-omarchy-performance-boost.git
cd linux-omarchy-performance-boost
chmod +x install.sh
./install.sh
```

---

## Usage

After installation, you can use the app in two ways:

### Terminal
```bash
boost
```

### App Launcher
Open your launcher (Walker, Wofi, Anyrun, Rofi, KDE, GNOME) and search for:
```
Boost Performance
```

---

## Uninstall

```bash
cd linux-omarchy-performance-boost
./uninstall.sh
```

Or manually:
```bash
rm ~/.local/bin/boost
rm ~/.local/share/icons/boost.png
rm ~/.local/share/applications/boost-performance.desktop
```

---

## What Gets Installed

| File | Location |
|------|----------|
| `boost` (script) | `~/.local/bin/boost` |
| `boost.png` (icon) | `~/.local/share/icons/boost.png` |
| `boost-performance.desktop` | `~/.local/share/applications/` |

---

## Requirements

- Linux (tested on Arch, Fedora, Ubuntu)
- `sudo` access (for changing CPU governor)
- Intel CPU with `intel_pstate` driver (optional, script works without it too)

---

## What the Script Does

1. **Disables `power-profiles-daemon`** - Stops the power management daemon that may override CPU settings
2. **Sets `intel_pstate` to passive** - Allows manual governor control on Intel CPUs
3. **Sets CPU governor to `performance`** - Forces all CPU cores to run at maximum frequency

>  **Note:** These changes are temporary and will reset after reboot. Run the script again after each boot if needed.

---

## What Problem Does This Solve?

On many Linux laptops with Intel CPUs, the power profile is stuck on **power-save mode** by default — even when plugged in. This causes:

- **Sluggish performance** during demanding tasks
- **Lower CPU frequencies** than your hardware can handle
- **Frustrating lag** in games, video editing, or compilation

The `power-profiles-daemon` and default kernel settings prioritize battery life over performance, which makes sense for mobile use — but not when you need raw power.

**This script fixes that** by forcing your CPU into maximum performance mode with a single command.

---

## License

MIT License - see [LICENSE](LICENSE)

---

## Contributing

Pull requests are welcome! Feel free to improve the script or add support for AMD CPUs.
