REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    if [[ "$(readlink "$dst")" == "$src" ]]; then
      echo "OK  : $dst"
    else
      echo "FIX : $dst"
      ln -sf "$src" "$dst"
    fi
    return 0
  fi

  if [[ -e "$dst" ]]; then
    echo "SKIP: $dst (exists, not a symlink)"
    return 0
  fi

  ln -s "$src" "$dst"
  echo "LINK: $dst -> $src"
}

# Add symlinks below 

link "$REPO_ROOT/config/zsh/.zshrc" "$HOME/.zshrc"
link "$REPO_ROOT/config/zsh/functions" "$HOME/.config/zsh/functions"
link "$REPO_ROOT/config/zsh/completions" "$HOME/.config/zsh/completions"
link "$REPO_ROOT/config/starship.toml" "$HOME/.config/starship.toml"
