# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="peepcode-pierec"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git, virtualenv-prompt)

# User configuration
  PROFILE="$HOME/.profile"
  ZSHRC_PRIVATE="$HOME/.zshrc-private"  

  if [ -f "$PROFILE" ]; then
      source "$PROFILE"
  fi

  if [ -f "$ZSHRC_PRIVATE" ]; then
      source "$ZSHRC_PRIVATE"
  fi

  export GOROOT=$HOME/.local/go
  export EDITOR=vim
  export PATH=$HOME/.local/bin:$PATH

  alias cd..="cd .."
  alias gut="git"
  alias prettyjson="python -mjson.tool"
  alias noblank='xset s off; xset -dpms; xset s noblank;'
  alias secondscreen='xrandr --output HDMI2 --right-of eDP1 --auto && noblank'

source $ZSH/oh-my-zsh.sh
