#
# Sets Prezto options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Init auto-completions
# Note: autocomp functions must be placed before compinit call
autoload -Uz compinit
compinit

# Use vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# For killing lag for vim key binding in zsh
export KEYTIMEOUT=1

# Shell variables
export LESS='-F -i -J -M -R -W -x4 -X -z-4'
export PAGER=less

# Command Alias
alias ls="gls --color"

# Node PATH for global packages
export NODE_PATH="/usr/local/lib/node_modules"

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/ruby/bin:$PATH" # Ruby
export PATH="/usr/local/opt/python/libexec/bin:$PATH" # Python
export PATH="/usr/local/opt/llvm/bin:$PATH" # LLVM
export PATH="$HOME/.cargo/bin:$PATH" # Cargo
export PATH="/usr/local/opt/ssh-copy-id/bin:$PATH" # ssh-copy-id

# llvm PATH and FLAG settings
export LDFLAGS="-L /usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Add terminfo directory to use tmux-color256 (not needed for MacOS Sonoma)
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
