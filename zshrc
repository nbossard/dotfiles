# NBO : THIS FILE SHOULD BE CALLED using "source /dotfiles/zshrc"
# from .zshrc
#
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# NBO : my conf of powerline-go
source ~/dotfiles/powerline-go.sh

# NBO : my aliases
source ~/dotfiles/profile

# NBO : Enable homebrew completion init
# Useful for "pass" completion to work
# see https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# NBO : enable autojump
# First installed using `brew install autojump`
# See https://github.com/wting/autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# editor to be used by pass (https://www.passwordstore.org/)
export EDITOR="nvim"
