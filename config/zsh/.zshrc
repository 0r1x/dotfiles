# Managed by your dotfiles repo and symlinked into ~/
# Goal: track only config; keep custom functions + completions in ~/.config/zsh

# ----------------------------
# PATH
# ----------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export EDITOR=vim
# ----------------------------
# History configuration
# ----------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY          # append, don't overwrite
setopt SHARE_HISTORY           # share between terminals
setopt HIST_IGNORE_DUPS        # ignore consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS    # remove older duplicate entries
setopt HIST_REDUCE_BLANKS      # trim extra spaces
setopt INC_APPEND_HISTORY     # write history immediately

# ----------------------------
# Zsh function + completion setup
# ----------------------------
# Put autoloadable functions here:
#   ~/.config/zsh/functions/<function-name>
# Put completion definitions here:
#   ~/.config/zsh/completions/_<command>
#
# These directories can be symlinks back into your dotfiles repo.
fpath=(
  "$HOME/.config/zsh/functions"
  "$HOME/.config/zsh/completions"
  $fpath
)

# Initialize completion system
autoload -Uz compinit
compinit

# ----------------------------
# Custom functions you want available
# ----------------------------
autoload -Uz alacritty-theme


# ----------------------------
# Keybindings (restore sane defaults after OMZ)
# ----------------------------

# Use emacs-style keybindings (default, explicit)
bindkey -e

# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Delete (the important one)
bindkey '^[[3~' delete-char


# ----------------------------
# Optional: user-only local overrides (NOT tracked)
# ----------------------------
# Put machine-specific or secret env vars here:
#   ~/.config/zsh/local.zsh
[[ -r "$HOME/.config/zsh/local.zsh" ]] && source "$HOME/.config/zsh/local.zsh"

# ----------------------------
# Optional: aliases (tracked) if you want to split later
# ----------------------------
# [[ -r "$HOME/.config/zsh/aliases.zsh" ]] && source "$HOME/.config/zsh/aliases.zsh"

# ----------------------------
# Enable Starship
# ----------------------------
 eval "$(starship init zsh)"
