<img src="https://capsule-render.vercel.app/api?type=waving&color=f5e0dc&height=300&section=header&text=Nixfrost&fontSize=80&animation=fadeIn&fontColor=cdd6f4" align="center" />

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-24.11-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-v0.41.2-%2358a6ff?style=for-the-badge&logo=wayland&logoColor=white)
![Catppuccin](https://img.shields.io/badge/Catppuccin-Mocha-f5e0dc?style=for-the-badge&logo=gitmoji&logoColor=cdd6f4)
![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

**A beautiful NixOS configuration with Hyprland, featuring the Catppuccin Mocha color palette**

</div>

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Structure](#structure)
- [Keybindings](#keybindings)
- [Theme Colors](#theme-colors)
- [Requirements](#requirements)

---

## Overview

Nixfrost is my personal NixOS + Hyprland dotfiles repository. It features a modern, aesthetically pleasing desktop environment with the beloved Catppuccin Mocha color scheme. Built with Nix flakes for declarative and reproducible system configuration.

---

## Features

### Desktop & Compositor

- <img src="https://img.shields.io/badge/Hyprland-58a6ff?style=flat&logo=wayland" /> **Hyprland** - Modern Wayland compositor
- <img src="https://img.shields.io/badge/Waybar-89b4fa?style=flat" /> **Waybar** - Highly customizable status bar
- <img src="https://img.shields.io/badge/SwayNC-f5c2e7?style=flat" /> **SwayNC** - Notification daemon
- <img src="https://img.shields.io/badge/Hyprlock-cba6f7?style=flat" /> **Hyprlock** - Beautiful lockscreen

### Terminal & Shell

- <img src="https://img.shields.io/badge/Kitty-ffa657?style=flat&logo=kitty" /> **Kitty** - Fast, GPU-accelerated terminal
- <img src="https://img.shields.io/badge/Zsh-f5e0dc?style=flat&logo=zsh" /> **Zsh** - Z shell with Oh My Zsh
- <img src="https://img.shields.io/badge/Starship-a6e3a1?style=flat" /> **Starship** - Minimal, blazing-fast prompt

### Utilities

- <img src="https://img.shields.io/badge/Delta-bac2de?style=flat&logo=git" /> **Delta** - Syntax-highlighting pager for git
- <img src="https://img.shields.io/badge/Eza-94e2d5?style=flat" /> **Eza** - Modern ls replacement
- <img src="https://img.shields.io/badge/Yazi-fab387?style=flat" /> **Yazi** - Blazing fast file manager
- <img src="https://img.shields.io/badge/Fastfetch-89dceb?style=flat" /> **Fastfetch** - Like neofetch, but faster
- <img src="https://img.shields.io/badge/Zoxide-1e1e2e?logo=bash" /> **Zoxide** - Smarter cd command

### Applications

- <img src="https://img.shields.io/badge/Thunar-4a90d9?style=flat&logo=xfce" /> **Thunar** - File manager
- <img src="https://img.shields.io/badge/Neovim-57a143?style=flat&logo=neovim" /> **Neovim** - Hyperextensible Vim editor

---

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/ijadux2/Nixfrost.git ~/Nixfrost
cd ~/Nixfrost
```

### 2. Build and switch configuration

```bash
sudo nixos-rebuild switch --flake .#itachi
```

Or use the alias (if already configured):

```bash
rebuild
```

### 3. Update configuration

```bash
home-manager switch --flake .#jadu@Nixfrost
```

---

## Structure

```
Nixfrost/
├── flake.nix                 # Flake inputs and outputs
├── configuration.nix         # NixOS system configuration
├── hardware-configuration.nix
├── home/
│   ├── jadu.nix              # Home Manager user config
│   ├── pkgs.nix              # System packages
│   ├── shell-pkgs.nix        # Shell packages
│   ├── services.nix          # System services
│   ├── time.nix              # Time/clock configuration
│   ├── jadu-pkgs.nix
│   ├── kitty/
│   │   ├── kitty.nix
│   │   └── theme.nix
│   ├── dotfiles/
│   │   ├── hypr/
│   │   │   ├── hyprland.conf    # Main Hyprland config
│   │   │   ├── mocha.conf        # Catppuccin Mocha colors
│   │   │   ├── keybind.conf
│   │   │   └── hyprlock.conf
│   │   ├── waybar/
│   │   │   ├── config.jsonc
│   │   │   ├── style.css
│   │   │   └── mocha.css         # Catppuccin colors
│   │   ├── sway/
│   │   │   └── scripts/          # Custom scripts
│   │   ├── swaync/
│   │   │   ├── config.json
│   │   │   └── style.css
│   │   ├── starship.toml
│   │   └── foot/
│   └── fonts/
│       └── JetBrainsMonoNerdFont-Regular.ttf
```

---

## Keybindings

### Main Modifiers

| Key     | Description                           |
| ------- | ------------------------------------- |
| `Super` | Main modifier (Windows key / Command) |

### Applications

| Keybinding      | Action                     |
| --------------- | -------------------------- |
| `Super + Enter` | Open terminal (Kitty)      |
| `Super + E`     | Open file manager (Thunar) |
| `Super + Space` | Open application launcher  |
| `Super + Q`     | Close active window        |

### Window Management

| Keybinding      | Action                    |
| --------------- | ------------------------- |
| `Super + F`     | Toggle fullscreen         |
| `Super + P`     | Toggle pseudotile         |
| `Super + J`     | Toggle split              |
| `Super + Arrow` | Focus window in direction |

### Workspaces

| Keybinding              | Action                   |
| ----------------------- | ------------------------ |
| `Super + [1-9]`         | Switch to workspace      |
| `Super + Shift + [1-9]` | Move window to workspace |

---

## Theme Colors

### Catppuccin Mocha Palette

| Color                                                       | Hex       | Usage     |
| ----------------------------------------------------------- | --------- | --------- |
| <img src="https://img.shields.io/badge/rosewater-f5e0dc" /> | `#f5e0dc` | Rosewater |
| <img src="https://img.shields.io/badge/flamingo-f2cdcd" />  | `#f2cdcd` | Flamingo  |
| <img src="https://img.shields.io/badge/pink-f5c2e7" />      | `#f5c2e7` | Pink      |
| <img src="https://img.shields.io/badge/mauve-cba6f7" />     | `#cba6f7` | Mauve     |
| <img src="https://img.shields.io/badge/red-f38ba8" />       | `#f38ba8` | Red       |
| <img src="https://img.shields.io/badge/maroon-eba0ac" />    | `#eba0ac` | Maroon    |
| <img src="https://img.shields.io/badge/peach-fab387" />     | `#fab387` | Peach     |
| <img src="https://img.shields.io/badge/yellow-f9e2af" />    | `#f9e2af` | Yellow    |
| <img src="https://img.shields.io/badge/green-a6e3a1" />     | `#a6e3a1` | Green     |
| <img src="https://img.shields.io/badge/teal-94e2d5" />      | `#94e2d5` | Teal      |
| <img src="https://img.shields.io/badge/sky-89dceb" />       | `#89dceb` | Sky       |
| <img src="https://img.shields.io/badge/sapphire-74c7ec" />  | `#74c7ec` | Sapphire  |
| <img src="https://img.shields.io/badge/blue-89b4fa" />      | `#89b4fa` | Blue      |
| <img src="https://img.shields.io/badge/lavender-b4befe" />  | `#b4befe` | Lavender  |

### Surface Colors

| Color                                                      | Hex       | Usage     |
| ---------------------------------------------------------- | --------- | --------- |
| <img src="https://img.shields.io/badge/text-cdd6f4" />     | `#cdd6f4` | Text      |
| <img src="https://img.shields.io/badge/subtext1-bac2de" /> | `#bac2de` | Subtext 1 |
| <img src="https://img.shields.io/badge/subtext0-a6adc8" /> | `#a6adc8` | Subtext 0 |
| <img src="https://img.shields.io/badge/overlay0-6c7086" /> | `#6c7086` | Overlay 0 |
| <img src="https://img.shields.io/badge/surface0-313244" /> | `#313244` | Surface 0 |
| <img src="https://img.shields.io/badge/base-1e1e2e" />     | `#1e1e2e` | Base      |
| <img src="https://img.shields.io/badge/mantle-181825" />   | `#181825` | Mantle    |
| <img src="https://img.shields.io/badge/crust-11111b" />    | `#11111b` | Crust     |

---

## Requirements

- **NixOS 24.11** or newer
- **Nix flakes** enabled
- **Hyprland** compatible GPU drivers
- **Wayland** session support

---

## Shell Aliases

Once configured, you can use these handy aliases:

```bash
update      # home-manager switch
rebuild     # Rebuild NixOS
clean       # Clean up nix store
v           # Open Neovim
fa          # Run fastfetch
y           # Open Yazi file manager
```

---

## Contributing

Feel free to fork this repository and customize it for your own setup. If you find any issues or have suggestions, please open an issue or pull request.

---

## License

MIT License - See [LICENSE](LICENSE) for details.

---

<div align="center">

**Made with** <img src="https://img.shields.io/badge/-%E2%9D%A4%EF%B8%8F-red?style=flat&logo=heart" /> **using Nix**

![Footer](https://capsule-render.vercel.app/api?type=waving&color=1e1e2e&height=100&section=footer)

</div>
