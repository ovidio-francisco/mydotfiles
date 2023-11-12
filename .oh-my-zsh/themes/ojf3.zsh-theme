#My ZSH Theme
PROMPT=""
PROMPT+="%(?"

PROMPT+=":%{$fg_bold[green]%}[%{$fg_bold[white]%}%c%{$fg_bold[green]%}]"
PROMPT+=":%{$fg_bold[red]%}[%{$fg_bold[white]%}%c%{$fg_bold[red]%}]"

PROMPT+=")"

PROMPT+='%{$reset_color%}$(git_prompt_info) '


ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[238]%}  ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#✗✘✓✔ 

