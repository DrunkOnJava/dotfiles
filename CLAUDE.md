# Dotfiles Repo

Griffin Long's macOS development environment configuration. Symlinked into ~/ via `install.sh`.

## Structure
- `shell/` — zshrc, zprofile, zshenv, profile (zsh config, PATH, tool activation)
- `git/` — gitconfig, gitignore_global (identity, editor, global ignores)
- `ssh/` — config only (keys are NEVER tracked — .gitignore enforces this)
- `config/` — karabiner, mise, gh, starship (app-specific configs)
- `claude/` — CLAUDE.md and settings.json for Claude Code
- `Brewfile` — all Homebrew packages and casks
- `install.sh` — symlinks everything into place, backs up existing files

## Rules
- Never add private keys, tokens, or credentials — the .gitignore blocks common patterns but stay vigilant
- When adding a new dotfile: add the source file, add a `link` line to `install.sh`, and update the Brewfile if it requires a new package
- Keep configs minimal — only override defaults when there's a reason
- Test changes by opening a new shell tab before committing — a broken .zshrc locks you out of new terminals
