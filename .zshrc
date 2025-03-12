# oh-my-zsh config
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME=
# ENABLE_CORRECTION="true"

# setup antidote - zsh package manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# pixi - python package manager
export PATH=$HOME/.pixi/bin:$PATH
eval "$(pixi completion --shell zsh)"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source local config
source $HOME/.zsh_extra

# Added for Golang
export PATH="$PATH:$(go env GOPATH)/bin"

# Editors
alias vim="nvim"
alias vi="nvim"
export EDITOR=vi

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

# prompt for non-warp
eval "$(starship init zsh)"

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

# zoxide - quick fs traversal
eval "$(zoxide init zsh)"

# mise - tool version manager
eval "$(~/.local/bin/mise activate zsh)"

# pnpm
export PNPM_HOME="/Users/msu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/msu/.lmstudio/bin"
