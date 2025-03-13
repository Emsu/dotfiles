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

# Wasmer
export WASMER_DIR="/Users/msu/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Wasmer completions
fpath=(/Users/msu/.zsh/completions /opt/homebrew/share/zsh/site-functions /Users/msu/.cache/zsh/completions /opt/homebrew/Cellar/antidote/1.9.7/share/antidote/functions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions /Applications/OrbStack.app/Contents/MacOS/../Resources/completions/zsh /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-jirutka-SLASH-zsh-shift-select /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zdharma-continuum-SLASH-fast-syntax-highlighting /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-getantidote-SLASH-use-omz /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/colored-man-pages /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/1password /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/aliases /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/git /Users/msu/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/magic-enter)
autoload -Uz compinit && compinit -i
