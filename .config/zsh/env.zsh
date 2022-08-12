case "$(uname -a)" in
  Linux*) source ~/.config/zsh/env.linux.zsh;;
  Darwin*) source ~/.config/zsh/env.mac.zsh;;
esac

export LESS='-R'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
