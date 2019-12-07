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

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# For killing lag for vim key binding in zsh
export KEYTIMEOUT=1

# Shell variables
export LESS="QMcdeR"
export PAGER=less

# Command Alias
alias ls="ls -GH"
alias rm="/usr/local/lib/node_modules/safe-rm/bin/rm.sh"
alias ..="cd .."

# Git alias for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Tmux Alias
alias tmuxre="sh ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh"
alias mux='pgrep -vxq tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'

# Node PATH for global packages
export NODE_PATH="/usr/local/lib/node_modules"
export WEATHERSTACK_KEY="1cce66081ea32ad97a784b61f01b446c"

# llvm PATH and FLAG settings
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L /usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PATH
