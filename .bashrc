#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



#PS1='[\u@\h \W]\$ '

# \u username
# \h hostname (short?)
# \w full path
# \W path shortened?
# \t time long
# \A time short


# TODO remove git branch if master or main
#      also show if the dir is not "gitted" ex. [×]
source .scripts/git-prompt.sh

# PS1='\[\033[1;34m\][\h:\W]$(__git_ps1 "--[%s]")\$\[\033[0m\] '
PS1='\[\033[1;34m\]'
PS1+='['
PS1+='\h:'
PS1+='\w'
PS1+=']'
PS1+='$(__git_ps1 "--[%s]")'
PS1+='\n\$\[\033[0m\] '
PS1+=''


alias ls='lsd'
alias cat='bat'

# profile doesnt work
# setxkbmap fi
setxkbmap -option caps:escape
