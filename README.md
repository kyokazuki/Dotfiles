# Dotfiles :card_index_dividers:
My desktop configuration files. [Wallpapers](/qtile/.config/qtile/) are created with my [ImageToPalette :art:](https://github.com/kyokazuki/ImageToPalette) python script.

![desktop.png](/desktop1.png)

## Programs
Some programs:
- Window manager: [qtile](https://github.com/qtile/qtile)
- Compositor: [picom](https://github.com/yshui/picom)
- Terminal emulator: [kitty](https://github.com/kovidgoyal/kitty)
- Shell: zsh
- Text editor: [neovim](https://github.com/neovim/neovim)
- File manager: [yazi](https://github.com/sxyazi/yazi)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- Fetch: [fastfetch](https://github.com/fastfetch-cli/fastfetch)

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
   This will create a folder ``~/.config/qtile`` linked to ``~/Dotfiles/qtile``.
