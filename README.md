# My Dotfiles

## This has the following things
1. .zshrc
2. i3
3. kitty
4. nvim
5. polybar
6. rofi
7. picom

### Steps to make this thing work
1. Install gnu stow

```sh
sudo pacman -S stow
```
2. Clone this project

```sh
git clone git@github.com:Abhishek-Raj-Poudel/dotfiles.git
```
3. Keep this folder in your home folder `/home/<your home folder name>` also known as `~/`

4. Then go to that folder

```sh
cd dotfiles
```
5. Once your in that folder do this

```sh
stow .
```

## Note

Backup any file in this project from your pc. For eg like make a backup of you `.zshrc` into something like `.zshrc.bak`


