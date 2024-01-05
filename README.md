# Bardusco's dotfiles

This repo uses [dotbot](https://github.com/anishathalye/dotbot) as a submodule to sync dotfiles

## Usage

- git clone git@github.com:bardusco/dotfiles.git ~/dotfiles
- cd ~/dotfiles
- ./install

### Configure the fonts:

#### MacOS

Download these four ttf files:

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Double-click on each file and click "Install". This will make MesloLGS NF font available to all applications on your system. Configure your terminal to use this font:

_iTerm2:_ Open iTerm2 → Preferences → Profiles → Text and set Font to MesloLGS NF. Alternatively, type p10k configure and answer Yes when asked whether to install Meslo Nerd Font.

#### ChromeOS ssh app:

Go to settings

- chrome-extension://pnhechapfaindjhompbnflcldabbghjo/html/nassh_preferences_editor.html

Add a custom css file

- https://cdn.jsdelivr.net/gh/bardusco/powerline-web-fonts@49d9b5ee3fb0cf1869a90f8af696a1fad4526dd7/PowerlineFonts.css

Select the font family:

- "MesloLGS NF for Powerline"

https://github.com/bardusco/powerline-web-fonts

### Download the latest neovim
```
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo mkdir /Applications
sudo mv nvim.appimage /Applications/.
sudo chmod 755 /Applications/nvim.appimage

sudo update-alternatives --install /usr/bin/vi vi /Applications/nvim.appimage 100
sudo update-alternatives --install /usr/bin/vim vim /Applications/nvim.appimage 100
sudo update-alternatives --install /usr/bin/editor editor /Applications/nvim.appimage 100
```

### Configure vim
`git clone https://github.com/bardusco/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

`:checkhealth`
to search for any problem
