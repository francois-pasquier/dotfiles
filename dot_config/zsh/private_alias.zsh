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
alias god-mode='claude --dangerously-skip-permissions --effort high'
alias godex='codex --dangerously-bypass-approvals-and-sandbox -c model_reasoning_effort="high" --search'
alias CC='/usr/local/bin/g++-11'
alias cz="chezmoi"
alias nix-diff='nvd diff $(home-manager generations | head -2 | tail -1 | sed "s/.*-> //") $(home-manager generations | head -1 | sed "s/.*-> //" | sed "s/ .*//")'
alias nix-reinstall='home-manager switch --flake "path:$HOME/.local/share/chezmoi#$USER@$(nix eval --impure --raw --expr "builtins.currentSystem")"'
alias nix-clean='nix profile wipe-history --profile ~/.local/state/nix/profiles/home-manager --older-than 30d && nix profile wipe-history --profile ~/.local/state/nix/profiles/profile --older-than 30d'
function nix-update() {
  rm -rf ~/.cache/nix/tarball-cache-v2
  local flake_dir old_gen new_gen cutoff nix_rev hm_rev
  flake_dir="$HOME/.local/share/chezmoi"

  cutoff="$(date -u -v-7d +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date -u -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ)"
  nix_rev="$(gh api "repos/NixOS/nixpkgs/commits?sha=nixpkgs-unstable&until=$cutoff&per_page=1" --jq '.[0].sha')" || return
  hm_rev="$(gh api "repos/nix-community/home-manager/commits?sha=master&until=$cutoff&per_page=1" --jq '.[0].sha')" || return
  if [[ ! "$nix_rev" =~ ^[0-9a-f]{40}$ || ! "$hm_rev" =~ ^[0-9a-f]{40}$ ]]; then
    echo "nix-update: could not resolve commits older than $cutoff (nixpkgs='$nix_rev' home-manager='$hm_rev')" >&2
    return 1
  fi
  echo "Pinning to commits >=7 days old (cutoff $cutoff):"
  echo "  nixpkgs       ${nix_rev}"
  echo "  home-manager  ${hm_rev}"
  sed -i.bak -E "s#(^ *nixpkgs\.url = \"github:NixOS/nixpkgs/)[^\"]+#\1${nix_rev}#" "$flake_dir/flake.nix" || return
  sed -i.bak -E "s#github:nix-community/home-manager/?[^\"]*#github:nix-community/home-manager/${hm_rev}#" "$flake_dir/flake.nix" || return
  rm -f "$flake_dir/flake.nix.bak"

  old_gen="$(readlink -f ~/.local/state/nix/profiles/home-manager)"
  nix flake update --flake "path:$flake_dir" || return
  nix-reinstall || return
  new_gen="$(readlink -f ~/.local/state/nix/profiles/home-manager)"
  if [ "$old_gen" = "$new_gen" ]; then
    echo "No changes."
  else
    nvd diff "$old_gen" "$new_gen"
  fi
  nix-clean
}
alias dc='docker-compose'
alias emacs='emacs -nw'
alias fuck='pkill -9'
alias g='git'
alias hollywood='docker run --rm -it bcbcarl/hollywood'
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
alias tch='tmux clear-history'
alias tn='tmux new'

# Shortcuts for virtual environment management
alias uvv='uv venv .venv'              # Create a venv in the current project
alias uva='source .venv/bin/activate'  # Activate the venv
alias uvd='deactivate'                 # Deactivate the venv

# Install & run
alias uvi='uv pip install'             # Install a package
alias uvr='uv pip install -r'          # Install from requirements.txt
alias uvu='uv pip install --upgrade'   # Upgrade a package
alias uvl='uv pip list'                # List installed packages

# Sync requirements
alias uvf='uv pip freeze > requirements.txt'   # Freeze current deps
alias uvs='uv pip sync requirements.txt'       # Sync env to match file

# For quick one-off runs in a venv
alias uvx='uv run'                    # e.g. uvx black ., uvx pytest

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias y='yarn'

alias android-emulator='emulator -avd pixel_9_16kb -no-snapshot'

# `git wt <branch>` cds into that worktree of the current repo, `git wt <TAB>` lists them in fzf,
# `git wt` alone opens the same picker. A git alias runs in a child process and cannot cd, so
# this wraps git. `git wt add|list|...` still reaches `git worktree` through the wt git alias.
function _git_wt_worktrees() {
  command git worktree list --porcelain 2>/dev/null | awk '
    /^worktree / { worktree = substr($0, 10); branch = "" }
    /^branch /   { branch = $0; sub(/^branch refs\/heads\//, "", branch) }
    /^$/         { print worktree "\t" branch }
  '
}

function git() {
  if [[ $1 != wt || $2 == (add|list|lock|move|prune|remove|repair|unlock|-*) ]]; then
    command git "$@"
    return
  fi
  command git rev-parse --git-dir >/dev/null || return
  local target=$2 line worktree_path branch
  if [[ -z $target ]]; then
    worktree_path=$(_git_wt_worktrees | cut -f1 | fzf) || return
    cd -- "$worktree_path"
    return
  fi
  for line in ${(f)"$(_git_wt_worktrees)"}; do
    worktree_path=${line%%$'\t'*}
    branch=${line#*$'\t'}
    if [[ $target == $branch || $target == ${worktree_path:t} || $target == $worktree_path ]]; then
      cd -- "$worktree_path"
      return
    fi
  done
  print -u2 "git wt: no worktree for '$target'"
  return 1
}

function _git-wt() {
  if (( CURRENT > 2 )); then
    _git-worktree
    return
  fi
  local -a worktrees
  local line worktree_path branch
  for line in ${(f)"$(_git_wt_worktrees)"}; do
    worktree_path=${line%%$'\t'*}
    branch=${line#*$'\t'}
    worktrees+=("${${branch:-${worktree_path:t}}//:/\\:}:$worktree_path")
  done
  _describe -t worktrees worktree worktrees
}

alias wtcd='git wt'

# Claude Code on DeepSeek: every request billed to DeepSeek, never to the Anthropic plan.
# Same permissions as god-mode; the key comes from ~/.config/deepseek/.env (DEEPSEEK_API_KEY=...).
function buddha-mode() {
  local key
  key=$(grep -E '^DEEPSEEK_API_KEY=' "$HOME/.config/deepseek/.env" 2>/dev/null | cut -d= -f2- | tr -d '"'"'"'')
  if [[ -z $key ]]; then
    echo "DEEPSEEK_API_KEY missing from ~/.config/deepseek/.env" >&2
    return 1
  fi
  ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic \
  ANTHROPIC_AUTH_TOKEN="$key" \
  ANTHROPIC_MODEL=deepseek-v4-pro \
  ANTHROPIC_SMALL_FAST_MODEL=deepseek-flash \
  ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4-pro \
  ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4-pro \
  ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-flash \
  CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4-pro \
  CLAUDE_CODE_MAX_CONTEXT_TOKENS=1000000 \
  claude --dangerously-skip-permissions "$@"
}
