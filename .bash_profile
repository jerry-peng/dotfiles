# Jerry Peng's Bash Profile

# Git Branch Auto-completion
test -f ~/.git-completion.bash && . $_

# Bash related
export LESS="QMcdeR"
export PAGER=less
export PS1="\$ \w => "
export CLICOLOR=1
export LSCOLORS="EHfxcxdxBxegecabagacad"

umask 007

# Alias
alias ls="ls -GH"
alias rm="/usr/local/lib/node_modules/safe-rm/bin/rm.sh"
alias ..="cd .."
alias cdcpn="cd ~/Documents/Jobs/companies"
alias cdrsm="cd ~/Documents/Jobs/resume/version3_html"
alias cdcl="cd ~/Documents/Jobs/cover_letter/version2_html"
alias cprsm="cp -a ~/Documents/Jobs/resume/version3_html ./resume"
alias cpcl="cp -a ~/Documents/Jobs/cover_letter/version2_html ./cover_letter"
alias rsmhtml="open -a 'Safari' ./resume.html"
alias clhtml="open -a 'Safari' ./cover_letter.html"
alias rsmpdf="open -a 'Preview' ./resume.pdf"
alias clpdf="open -a 'Preview' ./cover_letter.pdf"

# Node PATH for global packages
export NODE_PATH="/usr/local/lib/node_modules"

# llvm PATH and FLAG settings
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L /usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Cargo PATH
export PATH="$HOME/.cargo/bin:$PATH"

export PATH
