#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

link() {
    local src="$1"
    local dest="$2"
    local dest_dir
    dest_dir="$(dirname "$dest")"

    mkdir -p "$dest_dir"

    if [ -L "$dest" ]; then
        local current
        current="$(readlink "$dest")"
        if [ "$current" = "$src" ]; then
            echo -e "${GREEN}✓${NC} $dest (already linked)"
            return
        fi
        echo -e "${YELLOW}→${NC} $dest (relinked from $current)"
        ln -sf "$src" "$dest"
    elif [ -e "$dest" ]; then
        echo -e "${YELLOW}⚠${NC} $dest exists — backing up to ${dest}.bak"
        mv "$dest" "${dest}.bak"
        ln -s "$src" "$dest"
    else
        echo -e "${GREEN}+${NC} $dest"
        ln -s "$src" "$dest"
    fi
}

echo "Installing dotfiles from $DOTFILES"
echo ""

# Shell
link "$DOTFILES/shell/zshrc"      "$HOME/.zshrc"
link "$DOTFILES/shell/zprofile"   "$HOME/.zprofile"
link "$DOTFILES/shell/zshenv"     "$HOME/.zshenv"
link "$DOTFILES/shell/profile"    "$HOME/.profile"

# Git
link "$DOTFILES/git/gitconfig"         "$HOME/.gitconfig"
link "$DOTFILES/git/gitignore_global"  "$HOME/.gitignore_global"

# SSH (config only — never symlink keys)
link "$DOTFILES/ssh/config"       "$HOME/.ssh/config"

# Config files
link "$DOTFILES/config/karabiner/karabiner.json"  "$HOME/.config/karabiner/karabiner.json"
link "$DOTFILES/config/mise/config.toml"           "$HOME/.config/mise/config.toml"
link "$DOTFILES/config/gh/config.yml"              "$HOME/.config/gh/config.yml"
link "$DOTFILES/config/starship/starship.toml"     "$HOME/.config/starship/starship.toml"

# VS Code
VSCODE_USER="$HOME/Library/Application Support/Code/User"
link "$DOTFILES/config/vscode/settings.json"     "$VSCODE_USER/settings.json"
link "$DOTFILES/config/vscode/keybindings.json"   "$VSCODE_USER/keybindings.json"

# Claude Code
link "$DOTFILES/claude/CLAUDE.md"      "$HOME/.claude/CLAUDE.md"
link "$DOTFILES/claude/settings.json"  "$HOME/.claude/settings.json"

echo ""
echo "Done. All dotfiles are symlinked."
