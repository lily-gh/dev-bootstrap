export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  colored-man-pages
  encode64
)

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

# Instant prompt config
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run 'p10k configure' or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# checks if eza command is available before setting the aliases
if [ -x "$(command -v eza)" ]; then
    alias l="eza -1 --long --header --icons --group-directories-first --total-size"
    alias ls="eza -1 --group-directories-first"
    alias ll="eza --long --header --icons --group-directories-first --no-permissions --total-size"
    alias lp="eza --long --header --icons --group-directories-first --total-size"
    alias la="eza -a --long --header --icons --group-directories-first"
    alias lt="eza --tree --long --header --icons --git-ignore --group-directories-first --total-size"
    alias t="eza --tree --header --icons --git-ignore --group-directories-first"
fi

# if neovim is available, alias vim to open neovim instead
if command -v nvim &> /dev/null; then
    alias vim="nvim"
else
    echo "(!) nvim not available"
fi
