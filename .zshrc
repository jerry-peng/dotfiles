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
alias ls="ls --color"

# Git alias for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Tmux Alias
alias mux='pgrep -vxq tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'

# Base PATH and MANPATH
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH=""

# Node PATH for global packages
export NODE_PATH="/usr/local/lib/node_modules"

# llvm PATH and FLAG settings
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L /usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Cargo PATH
export PATH="$HOME/.cargo/bin:$PATH"

# GNU command PATHs and MANPATHs
gnu_commands=(
  'coreutils'
  'findutils'
  'gawk'
  'gnu-indent'
  'gnu-sed'
  'gnu-tar'
  'gnu-which'
  'grep'
)

for cmd in $gnu_commands; do
  export PATH="$(brew --prefix)/opt/$cmd/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/$cmd/libexec/gnuman:$MANPATH"
done


# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
