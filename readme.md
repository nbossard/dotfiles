# Configuration for console

- install zsh
    - `sudo apt install zsh`
    - or `brew install zsh`
- make zsh default shell
  chsh -s $(which zsh)
  and reboot
- install powerline
      sudo apt install powerline
- install oh my zsh
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
- install powerlevel9K theme
     git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
   change line in .zshrc
	ZSH_THEME="powerlevel9k/powerlevel9k"
- remove account from prompt
    add line in .zshrc :
         DEFAULT_USER=nbossard
