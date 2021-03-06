# Set color for commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Custom Aliases
alias d='du -sch .[!.]* * | sort -h'
alias diff='diff --color'
alias ll='ls -lshart'
alias ipe='curl ipinfo.io/ip'
alias pubip='curl ifconfig.io'
alias c='clear'
alias cpv='rsync -avhtP'
alias dc='docker-compose -f'
alias trash='mv --force -t /home/eric/.Trash'
alias gl='git log -p --stat --graph'
alias gs='git status'
#alias gl='git log -p --stat'
# Enable aliases to be sudo'ed
alias sudo='sudo '
alias untar='tar xvf'
