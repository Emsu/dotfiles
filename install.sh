#!/bin/zsh

if ! command -v brew &> /dev/null; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! brew list | grep antidote > /dev/null 2>&1 ; then
    echo "Installing antidote..."
    brew install antidote
fi

if ! command -v stow > /dev/null 2>&1; then
    echo "Installing stow..."
    brew install stow
fi

if ! command -v starship > /dev/null 2>&1; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh
fi

if ! command -v mise > /dev/null 2>&1; then
    echo "Installing mise..."
    brew install zstd
    curl https://mise.run | sh
fi

if ! command -v mise > /dev/null 2>&1; then
    echo "Installing ghostty..."
    brew install ghostty
fi

if ! command -v nvim > /dev/null 2>&1; then
    echo "Installing nvim..."
    brew install nvim
fi

if ! command -v mise > /dev/null 2>&1; then
    echo "Installing fzf..."
    brew install fzf
fi

if ! command -v mise > /dev/null 2>&1; then
    echo "Installing zoxide..."
    brew install zoxide
fi

if ! command -v delta > /dev/null 2>&1; then
    echo "Installing git-delta..."
    brew install git-delta
fi

stow .

# check gitconfig is setup
if [ -z "$(git config --global user.name)" ] || [ -z "$(git config --global user.email)" ]; then
    echo "Git configuration is incomplete. Please set up your identity."
    # read -p "Enter your name: " git_name
    # read -p "Enter your email: " git_email
    echo -n "Enter your name: " && read git_name
    echo -n "Enter your email: " && read git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
fi

if [ -z "$(git config --global core.pager)" ]; then
    echo "Setting up the diff pager..."
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global merge.conflictStyle zdiff3
fi
