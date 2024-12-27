#!/bin/zsh

if ! $(which antidote) ; then
    echo "Installing antidote..."
    brew install antidote
fi

if ! command -v stow > /dev/null 2>&1; then
    echo "Installing stow..."
    brew install stow
fi

stow .
