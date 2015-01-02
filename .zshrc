#
# Example .zshrc file for zsh 4.0
#
# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

# Search path for the cd command
#cdpath=(.. ~ ~/src /usr/src)

# Use hard limits, except for a smaller stack and no core dumps
#unlimit
#limit stack 8192
#limit core 0
#limit -s

umask 022

# Set up aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
#alias j=jobs
#alias pu=pushd
#alias po=popd
#alias d='dirs -v'
#alias h=history
alias grep=egrep
alias ll='ls -l'
alias la='ls -a'
#alias -g H='| head'
#alias -g T='| tail'
#alias -g G='| grep'
#alias -g L='| less'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# automatically remove duplicates from these arrays
#typeset -U path cdpath fpath manpath
typeset -U path cdpath fpath

# Set prompts
#PROMPT='%m%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

# Some environment variables
export MAIL=/var/spool/mail/$USERNAME

#MAILCHECK=300
HISTSIZE=200
DIRSTACKSIZE=20
HISTFILE="/$HOME/.zsh_history"	# added by sklee.
SAVEHIST=200			# added by sklee.

# Set/unset  shell options
#setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   notify pushdtohome autolist
#setopt   correctall autocd recexact longlistjobs
setopt   recexact longlistjobs
#setopt   autoresume histignoredups pushdsilent noclobber
setopt   autoresume histignoredups pushdsilent clobber
#setopt   autopushd pushdminus extendedglob rcquotes mailwarning
#setopt   autopushd pushdminus extendedglob rcquotes
setopt   autopushd pushdminus rcquotes
unsetopt bgnice autoparamslash
unsetopt automenu

#setopt nopromptcr

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
#bindkey '^Xa' _expand_alias
#bindkey '^Z' accept-and-hold
#bindkey -s '\M-/' \\\\
#bindkey -s '\M-=' \|

# bindkey -v               # vi key bindings

bindkey -e                 # emacs key bindings
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

# Completion Styles

# list of completers to use
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
#zstyle -e ':completion:*:approximate:*' max-errors \
#    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
 
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'


###############################################################
# sklee.

# Shell prompt setting.
if [ "$TERM" = "xterm" ]; then
 #PROMPT=$(echo '%{\033[31m%}%m:%~$ %{\033[30m%}')
  PROMPT=$(echo '%n@%m:%~$ ')
 #PROMPT=$(echo '%m:%~$ ')

  #PROMPT=$(echo '%{\033[31m%}%m$ %{\033[30m%}')
  #RPROMPT=$(echo '%{\033[32m%}%~%{\033[30m%}')
  #PROMPT='%n@%m:%~$ '
  #PROMPT='zsh %~$ '

  precmd () {print -Pn "\e]0;%n@%m: %~\a"}

else
  PROMPT=$(echo '%n@%m:%~$ ')
  #PROMPT=$(echo '%m:%~$ ')
fi

setopt norecexact
setopt nocorrect nocorrectall
setopt print_eight_bit
setopt autoremoveslash
setopt listpacked

#unalias run-help
autoload run-help
export HELPDIR=/usr/share/zsh/help  # directory for run-help function to find docs

eval `dircolors -b`

WORDCHARS=${(RS)WORDCHARS#/}	# Let `/' be a word delimiter
WORDCHARS=${(RS)WORDCHARS#=}	# Let `=' be a word delimiter
WORDCHARS=${(RS)WORDCHARS#_}
WORDCHARS=${(RS)WORDCHARS#-}
WORDCHARS=${(RS)WORDCHARS#.}

# Aliases.
alias ls='ls --color=auto -BF --show-control-chars'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias mutt='mutt -y'
alias find='noglob find'
alias dpkg='noglob dpkg'
alias v='vim -R'
alias vv='vim -R -t'
alias gdb='gdb -q'
alias g='git'

#bindkey -s '\e[17~' "find . -name '*.[ch]' | xargs grep "
#bindkey -s '\e[18~' "find . -name '**'\C-b\C-b"
bindkey -s '\C-x\C-g' "find . -name '*.[ch]' | xargs grep "
bindkey -s '\C-x\C-f' "find . -name '**'\C-b\C-b"

# git prompt.
autoload -U colors
colors
autoload -Uz vcs_info
#zstyle ':vcs_info:git*' formats "%s  %r/%S %b %m%u%c% "
zstyle ':vcs_info:git*' formats " %{$fg_bold[green]%}[%b]%{$fg_bold[magenta]%}"
precmd () { vcs_info }
setopt prompt_subst
#PS1="\$vcs_info_msg_0_$PS1"
PS1="%{$fg_bold[magenta]%}%n@%m:%~\$vcs_info_msg_0_$%{${reset_color}%} "

# Configuration management using git
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
