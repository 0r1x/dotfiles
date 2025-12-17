# dotfiles

Personal dotfiles managed with a small, explicit, symlink-based approach.

This repository is the source of truth for user-level configuration files. It favors clarity and predictability over frameworks or heavy tooling.

---

## Why this exists

There are a lot of solid tools and guides for managing dotfiles. This setup exists because I wanted something straightforward.

The goal was to:
- avoid treating the home directory as a Git working tree
- avoid turning configuration into a framework
- minimize external dependencies
- make it obvious what is loaded and why

Everything here is intentionally simple:
- the repository lives outside of `$HOME`
- configuration files are linked into place
- behavior is explicit and easy to reason about

The focus is on keeping the setup easy to understand and reproduce.
---

## Structure


---

## Overview

This repo is the **source of truth** for user-level configuration files.

Files in this repository are **symlinked** into their expected locations under `$HOME` using a small bootstrap script. The repository itself can live anywhere (e.g. `~/repos/dotfiles`).

Tracked:
- Zsh configuration
- Zsh autoloaded functions
- Zsh completion definitions
- Starship prompt configuration

Not tracked:
- Oh My Zsh or other shell frameworks
- Third-party plugins

---

## Structure

```

dotfiles/
├── config/
│   ├── zsh/
│   │   ├── .zshrc
│   │   ├── functions/
│   │   │   └── <autoloaded zsh functions>
│   │   └── completions/
│   │       └── _<command>   # zsh completion definitions
│   └── starship.toml
├── scripts/
│   └── link.sh
└── README.md

````

### Zsh layout

- **Functions**  
  `~/.config/zsh/functions/<name>`  
  Autoloaded via `fpath` and `autoload -Uz`.

- **Completions**  
  `~/.config/zsh/completions/_<command>`  
  Loaded by `compinit` using native zsh completion conventions.

This mirrors standard zsh behavior and avoids framework-specific magic.

---

## Installation

Clone the repo:

```bash
git clone https://github.com/<user>/dotfiles.git ~/repos/dotfiles
cd ~/repos/dotfiles
````

Run the linker:

```bash
./scripts/link.sh
```

This creates symlinks for managed files, without overwriting existing real files.

---

## Symlink Strategy

* Real files are **never overwritten**
* Existing symlinks are verified and corrected if needed
* The script is safe to re-run at any time

Example links created:

* `~/.zshrc`
* `~/.config/zsh/functions`
* `~/.config/zsh/completions`
* `~/.config/starship.toml`

---

## Prompt

The shell prompt is provided by **Starship**.

* Starship is treated as an external dependency
* Configuration lives in `config/starship.toml`
* The prompt is enabled via `.zshrc`

To disable Starship, remove the initialization line from `.zshrc`.

---

## Philosophy

This setup favors:

* native shell features
* explicit configuration over automation
* minimal indirection
* easy debugging

If something breaks, it should be obvious *why*.

---

## License

MIT

