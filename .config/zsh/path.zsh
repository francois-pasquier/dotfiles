case "$(uname -a)" in
  Linux*) source ~/.config/zsh/path.linux.zsh;;
  Darwin*) source ~/.config/zsh/path.mac.zsh;;
esac

path=(~/.bin $path)
path=(~/.local/bin $path)
path=(~/.rvm/bin $path)
path=(~/.yarn/bin $path)
path=(~/go/bin $path)
path=($ANDROID_HOME/emulator $path)
path=($ANDROID_HOME/tools $path)
path=($ANDROID_HOME/platform-tools $path)
