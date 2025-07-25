#                   __        _               
#                  / /_______| |__  _ __ ___  
#            /\/| / /|_  / __| '_ \| '__/ __| 
#           |/\/ / /_ / /\__ \ | | | | | (__  
#               /_/(_)___|___/_| |_|_|  \___| 
#



OS="$(uname -s)"

case "$OS" in 
	Linux*) IS_LINUX=true; IS_MAC=false ;;
	Darwin*) IS_LINUX=false; IS_MAC=true ;;
	*) IS_LINUX=false/ IS_MAC=false ;;
esac



CASE_SENSITIVE="true"

export RANGER_LOAD_DEFAULT_RC=FALSE
export EDITOR="nvim"
export MANPAGER='less -s -M +Gg'

export COMMANDS="~/Storage/.scripts/i3"
export COMMANDS="$HOME/Storage/.scripts/i3"

export ZSH="$HOME/.oh-my-zsh" 
ZSH_THEME="ojf3"
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:$PATH"
export PATH="/snap/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH


alias uptime='echo "$(command uptime -p) since $(command uptime -s)"'
alias fill-dirs="source $HOME/bin/fill-dirs-stack && dirs -v"

alias lsblk='lsblk -o NAME,MOUNTPOINT,LABEL,SIZE,fsused,FSUSE%'

alias term='echo -e "Term = $TERM"'
alias so='source ~/.zshrc'

alias rm='echo "Don''t use this shit! Try trash instead."'
alias mv='mv -iv'
alias cp='cp -iv'

if $IS_LINUX; then
	alias ll='ls -gohX --group-directories-first'
	alias Ll='ls -gohXL'
	alias lh='ls -Ad .*' # list the hidden
	alias ld='ls -A | grep "^\."'
elif $IS_MAC; then
	alias ll='ls -loh'
	export PATH="/usr/local/opt/trash-cli/bin:$PATH"
fi



alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias gitdotadd="gitdot add -p"
alias giti3='/usr/bin/git --git-dir=$HOME/.i3setup/ --work-tree=$HOME/.config'
alias 'gitdot add .'="echo don't use add . in a bare repository"



alias nvim='nvim -O'
alias vim='vim -O'
alias .vimrc='vim ~/.vimrc'
alias .zshrc='vim ~/.zshrc'

alias fzf='fzf --preview="cat {}"'
alias fzfvim='vim $(fzf --preview="cat {}")'

alias rg='urxvt -e ranger'

alias grep='grep --color=auto -i'
alias ping='ping 8.8.8.8 -c5'

alias o='xdg-open' 


# Make and jump into a directory
alias m=mkcd
alias mj=mkcd
alias mkjd=mkcd    
alias mkdirj=mkcd


alias ..='cd ..' 
alias ~='cd ~' 
alias 1='cd -1' 
alias 2='cd -2' 
alias 3='cd -3' 
alias 4='cd -4' 
alias tmp='cd /tmp'
alias dirs='dirs -v'

alias cmatrix='cmatrix -b' 
alias hl='highlight'

alias confi3='vim ~/.config/i3/config'
alias confblocks='vim ~/.config/i3blocks/config'


if [ -f ~/.alias.zsh ]; then
	source ~/.alias.zsh
fi

# export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 7; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal




NULLCMD=:
READNULLCMD=cat


mkcd() {
	if [ -z "$1" ]; then
		echo "Please provide the directory name or its path\n"
		return 1
	fi 

	mkdir -p "$1" && cd "$1"

	retVal=$?
	if [ $retVal -ne 0 ]; then
		echo "Faiô !";
	fi
}


set -o noclobber     # prevents ovewriting files by redirection
unsetopt AUTO_CD     # no auto_cd
bindkey -r "^[[Z"    # disable the shift tab
stty -ixon           # disable the <ctrl-s>
stty -echoctl        # prevents print ^C

# avoid the annoying bold slash (/) after a directory name
zle_highlight=(region:standout special:standout suffix:none isearch:underline)


# Changes de ls output style for some directories like the ones created on Windows. See dircolors tool.  
LS_COLORS='ow=38;5;166:di=01;34:';  
export LS_COLORS

# Colors the files and directories on tab completion
zstyle ':completion:*' list-colors $LS_COLORS



# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"


# 7 Amazing CLI Tools You Need To Try
# https://www.youtube.com/watch?v=mmqDYw9C30I

#                      _
#              _______| |__  _ __ ___
#             |_  / __| '_ \| '__/ __|
#            _ / /\__ \ | | | | | (__
#           (_)___|___/_| |_|_|  \___|
#

