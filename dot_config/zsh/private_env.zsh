export ANDROID_HOME="$HOME/Library/Android/sdk"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
export LESS='-R'
export PNPM_HOME="$HOME/Library/pnpm"

eval "$(fnm env --use-on-cd)"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

source /opt/homebrew/opt/chruby/share/chruby/auto.sh

chruby ruby-4.0.0
