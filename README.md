# Dotfiles :card_index_dividers:
My desktop configuration files. [Wallpapers](/qtile/.config/qtile/) are created with my [ImageToPalette :art:](https://github.com/kyokazuki/ImageToPalette) python script.

![desktop.png](/desktop1.png)

## Programs
Some applications:
- window manager: qtile
- terminal emulator: kitty
- shell: zsh
- text editor: neovim
- file manager: yazi
- launcher: rofi

## Import config
Simply copy files from this repo and place them in the proper directiories. Alternatively, to import multiple at once, one can utilize [Stow](https://www.gnu.org/software/stow/).
1. Install Stow.
2. Clone the repository in home directory.
   ```
   cd
   git clone https://github.com/kyokazuki/Dotfiles
   ```
3. Backup and remove any existing config files intended to be replaced.
4. Create symlinks with ``stow`` from the repository folder. Example with qtile:
   ```
   cd Dotfiles/
   stow qtile
   ```
   This will create a folder *~/.config/qtile -> ~/Dotfiles/qtile* linked to the one in the repo.
