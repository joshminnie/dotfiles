function prompt_char {
  if [ $UID -eq 0 ]; then echo "# "; else echo "$ "; fi
}

function prompt_hostname {
  local h="$(hostname)"

  if [ "$HOST" = "$h" ]; then
    echo 'local'
  else
    echo "$(hostname -s)"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
# ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[blue]%}"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{ ●%G%}"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ ✖%G%}"
# ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{ ✚%G%}"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{ ↓%G%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{ ↑%G%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{ …%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✓%G%}"

# Set the prompts
PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)$(prompt_hostname) %{$fg_bold[blue]%}%1~%{${reset_color}%} $(git_super_status)%{$fg_bold[blue]%}$(prompt_char)%{${reset_color}%}'
RPROMPT=''
