
CASE_SENSITIVE="true"

export RANGER_LOAD_DEFAULT_RC=FALSE
export EDITOR="vim"
export COMMANDS="~/Storage/.scripts/i3"
export COMMANDS="$HOME/Storage/.scripts/i3"


export ZSH="$HOME/.oh-my-zsh" 
ZSH_THEME="ojf2"
source $ZSH/oh-my-zsh.sh


export PATH="$HOME/bin:$PATH"


alias rm='echo "don'"'"'t use this shit! - try trash"'
alias mv='mv -iv'
alias cp='cp -iv'

alias ll='ls -gohX --group-directories-first'
alias Ll='ls -gohXL'
alias lh='ls -Ad .*' # list the hiddens
alias ld='ls -A | grep "^\."'

alias ccat='ccat --bg=dark' # https://github.com/jingweno/ccat

alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

stty -ixon   # desable the <ctrl-s>


alias vim='vim -O'
alias purevim='vim -u NONE' 
alias o='xdg-open' 
alias ..='cd ..' 
alias cmatrix='cmatrix -b' 
alias hl='highlight'


# alias        when='echo && when   --future=360 --past=-7 --noheader '
# alias   when-prof='when   --future=360 --past=-7 --noheader --calendar=~/.when/prof.calendar && echo'
# alias when-e-prof='when e --future=360 --past=-7 --noheader --calendar=~/.when/prof.calendar && echo'
# # alias whene='when e --calendar=~/.when/calendar && updateAppointments > ~/.when/xcalendar'


alias rg='urxvt -e ranger'

alias grep='grep --color=auto -i'

alias confi3='vim ~/.config/i3/config'
alias confblocks='vim ~/.config/i3blocks/config'


alias neofetch='neofetch --color_blocks off --gtk3 off --gtk2 off --disable terminal'


# ==============================================
# https://unix.stackexchange.com/questions/119/colors-in-man-pages 
# https://stackoverflow.com/questions/1049350/unable-to-make-less-to-indicate-location-in-percentage/19871578#19871578
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

export MANPAGER='less -s -M +Gg'



NULLCMD=:
READNULLCMD=cat

unsetopt AUTO_CD

tkdir() {
	mkdir "$1" && cd "$1"

	retVal=$?
	if [ $retVal -ne 0 ]; then
		echo "Faiô !";
	fi
}


bindkey -r "^[[Z"  # disable the shift tab

# avoid the annoying bold slash (/) after a directory name
# http://info2html.sourceforge.net/cgi-bin/info2html-demo/info2html?(zsh)Character%2520Highlighting
zle_highlight=(region:standout special:standout suffix:none isearch:underline)


# Changes de ls output style for some directories like the ones created on Windows.
# See dircolors tool.  # 38;5 means the color is a XTerm 256-color foreground code and 166 is the color.
LS_COLORS='ow=38;5;166:di=01;34:';  
export LS_COLORS

# Colors the files and directories on tab completion
zstyle ':completion:*' list-colors $LS_COLORS



