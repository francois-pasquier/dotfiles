# 🍀 My ChezMoi Dotfiles

Welcome to my personal dotfiles repository! 🛠️ Here, you’ll find configurations and scripts to set up my environment on macOS (with some love for Apple Silicon!). 🖥️ I use [chezmoi](https://www.chezmoi.io/) to manage all my dotfiles, keeping everything synchronized, organized, and easily deployable! 🌈

## 🚀 Quick Start

Get started with chezmoi to make these dotfiles yours! Here’s how:

```bash
# 1️⃣ Install chezmoi if you haven't already
brew install chezmoi

# 2️⃣ Clone this repo using chezmoi
chezmoi init --apply git@github.com:yourusername/dotfiles.git
```

## 🧩 Features

    Homebrew 🍻: Installs essential CLI tools and applications.
    Rosetta 2 🏃: Sets up Rosetta for Apple Silicon, enabling compatibility for Intel-based apps.
    App Store & Quarantine-Free Apps 🚫: Automates installs from the Mac App Store (via mas) and removes quarantine from specific apps (like Chromium and LibreWolf).
    zsh4humans 🧙: Ensures your shell environment is powered up with zsh4humans.

## 📝 Dotfiles Breakdown

Here's what you get with each setup:
### 📦 Package Management

    Homebrew: Essential CLI tools like git, jq, tmux, and neovim, plus a variety of apps (kitty, LibreOffice, Raycast, and more).
    App Store Packages: Key apps (like Xcode and Bitwarden) installed via mas.

### 💾 App Configurations

    Kitty 🐱: Customized terminal emulator setup for a sleek and functional workspace.
    tmux 🔲: Configured for multitasking and session management.

### 🐚 Shell Setup

    zsh4humans: Automatically installs if z4h isn’t available, with one-line installation!

### 💻 Installation Details

Here’s what our main install script does:

    Homebrew Installation:
        If Homebrew isn’t installed, it’s set up via a simple curl command.

    Rosetta 2 Installation (for Apple Silicon):
        Installs Rosetta 2 if not already available.

    Homebrew Packages:
        Installs CLI tools and applications via brew and brew cask.

    App Store Applications:
        Downloads Mac App Store applications using mas.

    Removing Quarantine Attributes:
        Removes the quarantine attribute from Chromium and LibreWolf for a smoother experience.

    zsh4humans Installation:
        Installs zsh4humans if z4h is missing, making your shell environment polished and powerful.

### 🛠 Customization

Feel free to customize any part of these configurations:

    Update packages.yaml for your preferred apps and tools.
    Adjust kitty.conf and .tmux.conf for your ideal terminal experience.

### 🌐 Requirements

    macOS (optimized for Apple Silicon but works on Intel too!).
    Homebrew (installed automatically if missing).
    mas for App Store applications (included with Homebrew setup).

### 📥 Contributing

Found an improvement? Make a PR! Or feel free to fork this repo and make it your own! 🍴

### 📄 License

This project is open-source and available under the MIT License.

Enjoy these dotfiles! 😊
