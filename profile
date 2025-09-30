# vim: set list:
# Bash profile common part to all my personal computers
#
# This file can be colored using :set syntax=bash
# vim: set syntax=bash foldmethod=marker:
#
# This file should be included in .profile or in .zshrc using:
# source ~/dotfiles/profile

# {{{ ------------------------- [ Conf utilities ] -----------------------------
alias python=python3
# }}}
# {{{ ------------------------- [ Aliases ] ------------------------- #

# trying to replace basic "cat" command by more advanced software "bat"
# See Bat on github :https://github.com/sharkdp/bat
alias cat="bat"
alias imgcat="wezterm imgcat"

alias llll="tree -L 2 -C"

# Git aliases
alias dev="git checkout develop"
alias develop="git checkout develop"
alias master="git checkout master"
alias main="git checkout main"
alias switch="git switch"
alias ggit="git"
alias lg="git lg"
alias lga="git lg --all"
alias pull="git pull"
alias status="git status"

# fuzzyfinder related config and alias
alias fzh="history | fzf"
# Making fuzzyfinder use ripgrep (for speed) and also to allow respect of .gitignore folder
# This will prevent cases such as many README.md
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --hidden'

alias nv="nvim"
alias lll="eza \
	   -l \
	   --icons \
	   --no-user \
	   --time-style long-iso \
	   --git"
alias ll=lll
alias lla=la
alias la="eza \
	   -la \
	   --icons \
	   --no-user \
	   --time-style long-iso \
	   --git"
alias top="htop"
alias cdd="cd"
alias bk="buku"
alias ol="obsidian-logging"


# Taskwarrior related speed-up aliases
alias t="task"
alias tt="task"
alias to="taskopen"
alias tui="taskwarrior-tui"
alias tw="timew"
alias day="timew day"
alias wrt="~/dotfiles/wezterm_rename_title.sh"
alias none="task context none"
alias work="task context work"
alias pro="task context work"
alias personal="task context perso"
alias perso="task context perso"
alias mattis="task context Mattis"

# Mac Only aliases
if [[ "$(uname)" == "Darwin" ]]; then
    # Do something under Mac OS X platform
    alias safari="open -a safari"
    alias chrome="open -a \"google chrome\""
    alias firefox="open -a \"firefox\""
    alias exchange="open -a Mail"
    alias sms="open https://messages.google.com"
    alias anki="open -a anki"
    alias freeplane="open -a freeplane"
    alias finder="open -a finder"
    alias teams="open -a \"Microsoft Teams\""
    alias vscode="open -a \"Visual Studio Code\""
    alias obsidian="open -a \"Obsidian\""

    # replacing mac provided version by
    # less old versions of gnu programs
    # installed via brew install util-linux
    alias cal="/opt/homebrew/opt/util-linux/bin/cal -m"
fi

# }}}
# {{{ ------------------------- [ Conf utilities ] -----------------------------

# to make cargo (rust) installed applications work
export PATH="$HOME/.cargo/bin:$PATH"

# NBO pipx addition (for language servers)
export PATH="$PATH:/Users/nbossard/.local/bin"

# required for homebrew command line tools to be available
eval "$(/opt/homebrew/bin/brew shellenv)"

# set go related env vars, required for example by treesitter parser in neovim
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# the fuck tool
eval $(thefuck --alias)
# }}}
