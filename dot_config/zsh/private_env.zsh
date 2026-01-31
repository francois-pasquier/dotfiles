export ANDROID_HOME="$HOME/Library/Android/sdk"
export LESS='-R'
export PNPM_HOME="$HOME/Library/pnpm"

# Detect Homebrew prefix
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(uname -m) == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  elif [[ -d "$HOME/.linuxbrew" ]]; then
    HOMEBREW_PREFIX="$HOME/.linuxbrew"
  fi
fi

# Fallback to brew --prefix if available
if [[ -z "$HOMEBREW_PREFIX" ]] && command -v brew >/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openjdk@11/include"

  if [[ -f "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
    source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"
    chruby ruby-4.0.0
  fi
fi

eval "$(fnm env --use-on-cd)"
