# dotfiles

Griffin Long's macOS development environment.

## Setup on a new machine

```bash
# 1. Install Xcode Command Line Tools
xcode-select --install

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# 3. Clone this repo
git clone git@github.com:DrunkOnJava/dotfiles.git ~/.dotfiles

# 4. Install Homebrew packages
cd ~/.dotfiles && brew bundle

# 5. Symlink dotfiles
./install.sh

# 6. Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 7. Install language runtimes via mise
mise install

# 8. Generate SSH key and add to GitHub
ssh-keygen -t ed25519 -C "griffinradcliffe@gmail.com"
gh auth login
```

## Structure

```
shell/          zshrc, zprofile, zshenv, profile
git/            gitconfig
ssh/            config (keys are never tracked)
config/
  karabiner/    keyboard remapping (Hyper key)
  mise/         language runtime versions
  gh/           GitHub CLI config
claude/         Claude Code global config
Brewfile        Homebrew packages
install.sh      Symlink everything into place
```

## Updating

Edit the files in `~/.dotfiles/` — they're symlinked, so changes take effect immediately. Commit and push when you're happy with the state.
