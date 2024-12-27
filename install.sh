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
    curl https://mise.run | sh
fi

stow .
