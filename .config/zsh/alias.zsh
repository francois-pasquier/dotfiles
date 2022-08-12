case "$(uname -a)" in
  Linux*) source ./alias.linux.zsh;;
  Darwin*) source ./alias.mac.zsh;;
esac

alias :q='exit'
alias cc=/usr/local/bin/g++-11
alias CC=/usr/local/bin/g++-11
alias dc='docker-compose'
alias emacs='emacs -nw'
alias find='fd'
alias fuck='pkill -9'
alias j='just'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -la'
alias m='make'
alias g='git'
alias please='sudo'
alias grep='rg'
alias rndbg='adb shell input keyevent 82'
alias rsync='rsync -avh'
alias sv='sudo -E nvim'
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tn='tmux new'
alias nvim="TERM='xterm-kitty' nvim"
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias y='yarn'
