# Bash profile common part to all my personal computers
#
# This file can be colored using :set syntax=bash
# vim: set syntax=bash foldmethod=marker:
#
# This file should be included in .profile or in .zshrc using:
# source dotfiles/profile

# {{{ ------------------------- [ Conf utilities ] -----------------------------

# {{{ The fuck
# NBO addition: auto correct of previous command
# Usage : "lss -la"  <== command with a typo
#         "fuck"     <== corrects the previous command
eval $(thefuck --alias)
# }}}

# }}}

# {{{ ------------------------- [ Aliases ] ------------------------- #

# trying to replace basic "cat" command by more advanced software "bat"
# See Bat on github :https://github.com/sharkdp/bat
alias cat="bat"

alias llll="tree -L 2 -C"

alias dev="git checkout develop"
alias develop="git checkout develop"

# fuzzyfinder related config and alias
alias fzh="history | fzf"
# Making fuzzyfinder use ripgrep (for speed) and also to allow respect of .gitignore folder
# This will prevent cases such as many README.md
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --hidden'

alias nv="nvim"
alias lll="exa -la --icons --no-user --time-style long-iso"
alias top="htop"
alias cdd="cd"
alias bk="buku"
alias t="task"
alias tt="task"
alias to="taskopen"
alias tui="taskwarrior-tui"
alias tw="timew"
alias day="timew day"
alias status="git status"
alias lg="git lg"
alias lga="git lg --all"

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
fi

# }}}
