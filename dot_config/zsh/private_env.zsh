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

eval "$(mise activate zsh)"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
