# .bashrc_add

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# proxy setting

 ## completion setting
 #complete -D -o default

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

## completion setting
#complete -D -o default
## color setting
#eval `dircolors ~/.dircolors_bash`
#alias ls='ls -F --color=auto'

 # User specific aliases and functions

 #alias ll='ls -l'                             # long list
 alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #
 alias sl='ls -CF'                             #
 alias ll="ls -alt"
 alias lll='ls -alt|less'
 alias lln='ls -alnt'
 alias vi='vim'                                #
 alias vr='vim -R'                                #
 alias v='/usr/bin/vi'                                  #
 alias rf='rm -Rf'                             #
 alias rrf='rm -Rf'                             #
 alias rr='rm -R'                              #
 alias cr='cp -Rp'                             #
 alias br="vi ${HOME}/.bashrc_add"
 alias vo="vi ${HOME}/.bashrc_add"
 alias vl="vi ${HOME}/.bashrc_local"
 alias vv="vi ${HOME}/.vimrc"
 alias vc="vi ${HOME}/.dircolors_bash"
 alias so="source ${HOME}/.bashrc"
 #alias so="source ${HOME}/.bash_profile"
 alias dfk='df -k .'
 alias dfh='df -h .'
 alias duk='du -ks .'
 alias duh='du -hs ./*'
 alias duhm='du -hs ${HOME}/'
 alias e='env |less'
 alias c='clear'
 alias cls='clear;ls'
 alias h=history
 alias hl='h|less'
 alias l1="ls -1;"
 alias ls1="ls -1;"
 alias la="ls -a"
 alias lsr="ls -RC"
 alias nless='/usr/local/bin/less -N'
 alias pse="ps -ef|grep `whoami`"
 alias xc='chmod 755'
 alias xch='chmod 777'
 alias fig='find | egrep'
 alias lst='last |grep still'
 alias sdf='sdiff -w 150'
 alias ssdf='sdiff -sw 150'

 ### Editor

 export EDITOR="vim"

 ### prompt setting ###
 #export PS1="{\h:\u:\[\e[1;35m\]\W\[\e[00m\]}> "

 ### language setting ###
 export LANG=ja_JP.UTF-8

 ### local setteings

 if [ -f ~/.bashrc_local ]; then
     source ~/.bashrc_local
 fi
