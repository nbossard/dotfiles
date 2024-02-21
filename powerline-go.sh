# this is config for powerline-go
#
# This file can be colored using :set syntax=bash
# vim: set syntax=bash foldmethod=marker:
#
# This file should be included in .profile or in .zshrc using:
# source ~/dotfiles/powerline-go.sh


function powerline_precmd() {

    # below is cutomisation of powerline-go
    #
    PS1="$(/opt/homebrew/bin/powerline-go -hostname-only-if-ssh -error $? -jobs ${${(%):%j}:-0})"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "/opt/homebrew/bin/powerline-go" ]; then
    install_powerline_precmd
fi

