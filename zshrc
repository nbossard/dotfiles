# vim: set filetype=bash foldmethod=marker foldlevel=0:
# NBO : THIS FILE SHOULD BE CALLED using "source /dotfiles/zshrc"
# from ~/.zshrc
# it contains zsh specific configuration, while profile is more generic

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

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

## Node Version Manager (nvm) related configuration
# useful especially for working with kibana (which uses difference node versions in different branches)
# usage samples :
# 	nvm use
# 	nvm install 20.13.2
# {{{
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#}}} --------------------------------------------

# compute info about nvim being in background
# for use by powerline-go
# {{{
function count_nvim_in_current_terminal() {
    # Get the current terminal's TTY identifier
    local current_tty=$(tty)

    # Count the number of Neovim processes associated with this TTY
    export NVIM_COUNT=$(ps -t "$current_tty" -o comm= | grep -c nvim)

    # Get the system-wide memory free percentage
    local memory_free_percentage=$(memory_pressure | sed -n 's/.*System-wide memory free percentage: \([0-9]*\)%.*/\1/p')
    # Export the percentage for use in the prompt
    export MEMORY_FREE_PERCENTAGE=$memory_free_percentage

    # Same with label prefix for understandable display
    # empty if NVIM_COUNT is 0
    local nvim_label=$([ "$NVIM_COUNT" -eq 0 ] && echo "" || echo "nvim:$NVIM_COUNT")
    local mem_label=$([ " $MEMORY_FREE_PERCENTAGE" -gt 50 ] && echo "" || echo "Mem:$MEMORY_FREE_PERCENTAGE%%")

    # Combine the labels
    export NVIM_COUNT_LABEL="$nvim_label$mem_label"
}
# Call the function whenever a new shell session is started
count_nvim_in_current_terminal
# and before each prompt display
autoload -Uz add-zsh-hook
add-zsh-hook precmd count_nvim_in_current_terminal
#}}} --------------------------------------------

# display warning about non optimal commands
# {{{
# Liste des commandes à bloquer
blocked_commands=("rm -rf" "sudo rm -rf" "command_to_block")
blocked_commands+=("git push --force") # use `git push --force-with-lease`

# Fonction preexec pour vérifier les commandes
function preexec() {
  for cmd in "${blocked_commands[@]}"; do
    if [[ "$1" == "$cmd"* ]]; then
      echo "Commande bloquée : $cmd"
      return 1
    fi
  done
}

# Ajouter le hook preexec
autoload -Uz add-zsh-hook
add-zsh-hook preexec preexec
# }}} ------------------------------------------

# to make eza (lll) use theme gruvbox
export EZA_CONFIG_DIR="/Users/nbossard/dotfiles/eza"

# editor to be used by pass (https://www.passwordstore.org/)
export EDITOR="nvim"

# to make docker tools like dockly use colima
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
