source $HOME/.config/zsh/zsh4h.zsh
source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/keybindings.zsh

if [ -e "$HOME/.pyenv/.pyenvrc" ]; then
  z4h source $HOME/.pyenv/.pyenvrc
fi
