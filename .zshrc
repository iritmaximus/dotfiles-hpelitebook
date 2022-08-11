# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='lsd'
alias cat='bat'
# alias vim='nvim'
# alias vvim='vim'

setxkbmap -option caps:escape

bindkey ^L clear-screen


# zhs stuff?

preexec(){ cmd=$1; }


autoload -Uz add-zsh-hook

function reset_broken_terminal () {

  if [[ -z  '$argv[0]' ]];
    then 
      printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8';
      clear;
  fi
}

# add-zsh-hook -Uz precmd reset_broken_terminal
# add-zsh-hook -Uz preexec testThings

source ~/.scripts/two-line-prompt.zsh

RPROMPT='[ %* ]'
PROMPT=$'( %~ )\n > '
