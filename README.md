# ❄️ Nixfrost

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-v24.11-blue?logo=nixos&logoColor=white&style=for-the-badge)
![Window Manager](https://img.shields.io/badge/WM-Hyprland-85d1ff?logo=hyprland&logoColor=white&style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Catppuccin-f5c2e7?logo=catppuccin&logoColor=white&style=for-the-badge)
![Editor](https://img.shields.io/badge/Editor-Sharingan.nvim-red?logo=neovim&logoColor=white&style=for-the-badge)

**A high-performance, aesthetically pleasing NixOS configuration built for coding and daily productivity.**

[The Rice](#-the-rice) • [Tech Stack](#-tech-stack) • [Installation](#-installation) • [Keybinds](#-keybinds)

</div>

---

## 🖥️ The Rice

![desktop](./assets/screenshot_2026-03-13_21-48-55.png)

> **Note**: This setup is optimized for Wayland. It uses a custom
> Catppuccin Mocha color palette across all applications for a
> seamless visual experience.

---

## ✨ Features

- 🧊 **Declarative & Reproducible**: Powered by Nix Flakes—rebuild your
  entire OS with one command.
- ⚡ **Performance Optimized**: Low-latency terminal emulators (**Foot/Kitty**)
  and a lightweight Wayland compositor.
- 📂 **Modern CLI Workflow**: Features `yazi` for file management and `zoxide`
  for smart directory jumping.
- 👁️ **Sharingan.nvim**: A pre-configured, lethal Neovim environment
  tailored for full-stack development.

---

## 🛠️ Tech Stack

| Category           | Tool                                                        | Description                           |
| :----------------- | :---------------------------------------------------------- | :------------------------------------ |
| **Window Manager** | [Hyprland](https://hyprland.org/)                           | Dynamic tiling Wayland compositor     |
| **Status Bar**     | [Waybar](https://github.com/Alexays/Waybar)                 | Highly customizable Wayland bar       |
| **Shell**          | [Zsh](https://www.zsh.org/)                                 | With Starship prompt & Zoxide         |
| **Terminals**      | Kitty / Foot                                                | GPU-accelerated & lightweight options |
| **Editor**         | [Sharingan.nvim](https://github.com/ijadux2/Sharingan.nvim) | Custom Neovim configuration           |
| **File Manager**   | Yazi / Thunar                                               | Terminal and GUI file management      |
| **Theme**          | Catppuccin                                                  | Global Mocha colorscheme              |

---

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/ijadux2/Nixfrost.git ~/Nixfrost
cd ~/Nixfrost

# via nix
nix run --extra-experimental-features "nix-command flakes" github:ijadux2/Nixfrost

# apply config
sudo nixos-rebuild switch --flake .#itachi
```
