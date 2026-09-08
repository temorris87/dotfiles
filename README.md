# dotfiles

Personal configuration for this Omarchy (Arch + Hyprland) machine, managed with
[GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a **stow package** — a self-contained tree that mirrors
its final location under `$HOME`. Running `stow <package>` from this directory
symlinks the package's files into place; `stow -D <package>` removes them.

```
dotfiles/
  nvim/.config/nvim/...      ->  ~/.config/nvim  (symlink)
  bash/.bashrc               ->  ~/.bashrc       (symlink)
  ...
```

## Usage

```bash
cd ~/dotfiles

stow nvim                 # link one package
stow */                   # link every package
stow -R nvim              # re-link (after adding files to the package)
stow -D nvim              # unlink (real files stay here in the repo)
stow -n -v nvim           # dry run — show what would happen

# omarchy must be stowed without directory folding (Omarchy's package writes
# its own files into ~/.config/omarchy):
stow --no-folding omarchy
```

## New machine

```bash
sudo pacman -S --needed stow git
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
# move any pre-existing target files aside first, then:
stow */ ; stow -D omarchy ; stow --no-folding omarchy
systemctl --user enable --now voxtype.service   # .wants symlinks aren't tracked
```

If a target already exists as a real file, either move it aside or
`stow --adopt <package>` (pulls the existing file into the repo) then
`git diff` / `git checkout .` to decide which version wins.

## Packages

| Package | Links to |
|---|---|
| `bash` | `~/.bashrc`, `~/.bash_profile`, `~/.bash_logout` |
| `xcompose` | `~/.XCompose` |
| `alacritty` `foot` `ghostty` `kitty` | `~/.config/<term>/` |
| `git` | `~/.config/git/config` |
| `nvim` | `~/.config/nvim/` (LazyVim, `lazy-lock.json` tracked) |
| `tmux` `herdr` | terminal multiplexer configs |
| `lazygit` `btop` `starship` `mise` `opencode` | dev tool configs |
| `hypr` | `~/.config/hypr/` (Hyprland) |
| `omarchy` | `~/.config/omarchy/shell.json`, `branding/` — **`--no-folding`** |
| `hypr-share-picker` | `~/.config/hyprland-preview-share-picker/config.yaml` |
| `fcitx5` | `~/.config/fcitx5/` profile + `conf/*.conf` |
| `wireplumber` | `~/.config/wireplumber/wireplumber.conf.d/` |
| `systemd` | `~/.config/systemd/user/voxtype.service` |
| `voxtype` | `~/.config/voxtype/config.toml` |
| `imv` `xournalpp` | app configs |
| `mimeapps` | `~/.config/mimeapps.list` |
| `chromium-flags` | `~/.config/chromium-flags.conf` |
| `gtk` | `~/.config/gtk-3.0/bookmarks` |
| `autostart` | `~/.config/autostart/*.desktop` (Hidden overrides) |
| `obsidian` | `~/.config/obsidian/user-flags.conf` |

## Notes

- **`omarchy refresh <x>` / `omarchy reinstall`** replaces a symlink with a fresh
  real file. To recover: fold the wanted changes back into the package and
  `stow -R <package>`.
- Hyprland auto-backups (`*.lua.bak.<timestamp>`) are git-ignored; old ones were
  moved to `~/.local/state/hypr-backups/`.
- Deliberately **not** tracked: browser/Electron profiles, caches, `dconf`,
  `pulse`, `ibus`, sockets, `~/.claude*`, `~/.codex`, and other secrets/state.
