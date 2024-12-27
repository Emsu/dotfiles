# Dotfiles

Based on [managing dotfiles](https://www.jakewiesler.com/blog/managing-dotfiles)
Manage configuration files across multiple machines.
Uses [GNU Stow](https://www.gnu.org/software/stow/) to symlink files.

## Quick Start

1. Install GNU Stow:
```zsh
# macOS
brew install stow
```

2. Clone repository:
```bash
git clone https://github.com/Emsu/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

4. Create symlinks:
```bash
stow .
```

## Structure (example)

```
.
├── .gitconfig         # Git config
├── .vimrc            # Vim config
├── .zshrc            # Zsh config
├── .config/
│   ├── nvim/        # Neovim
│   └── kitty/       # Terminal
└── scripts/         # Shell scripts
```

## Commands

```bash
# Create symlinks
stow .

# Remove symlinks
stow -D .

# Re-create symlinks
stow -R .
```

## Adding New Files

1. Add file to repo:
```bash
mv ~/.vimrc ~/.dotfiles/
```

2. Create symlink:
```bash
cd ~/.dotfiles
stow .
```

## Backup

Commit and push changes:
```bash
git add .
git commit -m "Update dotfiles"
git push
```

## Tips

- Use `.gitignore` for sensitive files
- Create per-machine branches for specific configurations
- Document dependencies in README
