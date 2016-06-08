#
# Based on Geoffrey Grosenbach's peepcode zsh theme from
# https://github.com/topfunky/zsh-simple
#

local smiley="%(?,,%{$fg[red]%}$? %{$reset_color%})"

PROMPT='$(virtualenv_prompt_info)%F{red}%B[%b%f%F{green}%~%f%F{red}%B]%b%f
${smiley}> '

RPROMPT='%{$fg[white]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=") "

