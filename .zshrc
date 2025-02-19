# Start Hyprland with uwsm

if uwsm check may-start; then
  exec uwsm start hyprland.desktop
fi
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=fr_FR
export PATH=$PATH:/usr/local/go/bin
#fastfetch
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	git
	colored-man-pages
	kitty
	sudo
	systemadmin
	zsh-autosuggestions

	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
export LANG=fr_FR

# For a full list of active aliases, run `alias`.
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias nv="nvim"
alias ls="ls -la --color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LC_CTYPE=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
export GTK_THEME=Catppuccin-Dark
systemctl --user reload waybar.service
