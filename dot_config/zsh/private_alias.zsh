# Mac
alias g++='/opt/homebrew/bin/g++-11'
alias gcc='/opt/homebrew/bin/gcc-11'
alias nproc="sysctl -n hw.ncpu"
alias nvim='env CC=/opt/homebrew/bin/gcc-11 nvim'
alias unquarantine="sudo xattr -rd com.apple.quarantine"

# Unix
alias :q='exit'
alias b='bun'
alias cc='/usr/local/bin/g++-11'
alias CC='/usr/local/bin/g++-11'
alias cz="chezmoi"
alias dc='docker-compose'
alias emacs='emacs -nw'
alias find='fd'
alias fuck='pkill -9'
alias g='git'
alias grep='rg'
alias j='just'
alias la='eza -a'
alias lal='eza -la'
alias ll='eza -l'
alias logcat='adb logcat -c && adb logcat -v color'
alias ls='eza'
alias m='make'
alias nv='neovide'
alias nvim="TERM='xterm-kitty' nvim"
alias p="pnpm"
alias pip='pip3'
alias please='sudo'
alias rndbg='adb shell input keyevent 82'
alias rsync='rsync -avh'
alias sshk="kitty +kitten ssh"
alias sv='sudo -E nvim'
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tn='tmux new'
alias tch='tmux clear-history'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias y='yarn'
