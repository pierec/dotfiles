# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="peepcode-pierec"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git, virtualenv-prompt)

# User configuration
  ZSHRC_PRIVATE="$HOME/.zshrc-private"  

  if [ -f "$ZSHRC_PRIVATE" ]; then
      source "$ZSHRC_PRIVATE"
  fi

  export EDITOR=vim

  alias cd..="cd .."
  alias gut="git"
  alias prettyjson="python -mjson.tool"
  alias noblank='xset s off; xset -dpms; xset s noblank;'
  alias secondscreen='xrandr --output HDMI2 --right-of eDP1 --rotate normal --auto && noblank'
  alias secondscreen_vertical='xrandr --output HDMI2 --right-of eDP1 --rotate left --auto && noblank'

  source /usr/bin/virtualenvwrapper_lazy.sh

  NVM_INIT_SCRIPT="$HOME/.local/bin/init-nvm.sh"
  nvm () {
    [ -f "$NVM_INIT_SCRIPT" ] && source "$NVM_INIT_SCRIPT" && nvm $@
  }

source $ZSH/oh-my-zsh.sh
