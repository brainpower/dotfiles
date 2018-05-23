# Filename:      .zsh/aliases
# Purpose:       config file for shells with alias support
# Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
################################################################################
# This file gets sourced by my .zshrc or .bashrc
################################################################################

alias urldecode='python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read())"'
alias urlencode='python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.stdin.read())"'

# bp: make aliases avaiable with sudo, zsh hack
alias sudo='sudo '

alias fbterm='FBTERM=1 fbterm'
alias sctl='systemctl '

# make gnu++17 the default std
alias g++='g++ -std=gnu++17'

alias less='less -R '

alias en='LC_ALL=C '

alias bossbox='dosbox '

# add verbose flag to some commands
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias xz='xz -v'
alias gzip='gzip -v'
alias bzip2='bzip2 -v'
alias cdrecord='cdrecord -v'
alias amv='amv -vg '
alias acp='acp -vg '
alias rmf="rm -rf"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete -o -name '[Tt]humbs.db' -type f -ls -delete"

alias pgrep='pgrep -l '
alias lsblk='lsblk -f '
alias hd='hexdump -C '

# some program shortcuts
alias j='java'
alias jc='javac'
alias jws='javaws'

# some little helpers
alias rot13='tr "[a-zA-Z]" "[n-za-mN-ZA-M]"'

alias gt-save='gnome-terminal --save-config=$HOME/term.sess'
alias gt-load='gnome-terminal --load-config=$HOME/term.sess'

# log out from kde
alias klogout='DISPLAY=:0 /usr/bin/qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1'
alias klogout2='DISPLAY=:0 /usr/bin/qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 0 0'
alias kshutd='DISPLAY=:0 /usr/bin/qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 2 2'


## get top 10 shell commands:
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# bp: ls all files, no directories
alias lsf='ls -d *(^/) '${ls_options:+"${ls_options[*]}"}
alias lsd='ls -d *(/) '${ls_options:+"${ls_options[*]}"}
alias lha='ls -lha '${ls_options:+"${ls_options[*]}"}
alias lai='la --time-style=long-iso'
# bp: cd to parent and remove the dir we were in if it's empty, cd back otherwise
alias rmcd='cd ..; rmdir $OLDPWD || cd $OLDPWD'


###
# some global aliases (for those who like them)
##

#alias -g C='|wc -l'
#alias -g G='|grep'
#alias -g H='|head'
#alias -g Hl=' --help |& less -r'
#alias -g L='|less'
#alias -g N='&>/dev/null'
#alias -g S='| sort'
#alias -g T='|tail'
#alias -g V='| vim -'

###
# overriding grml aliases
##

# bp: override ls alias to not use -b
if [[ "$TERM" != dumb ]]; then
	alias ls='ls -CF '${ls_options:+"${ls_options[*]}"}
else
	alias ls='ls -CF'
fi

# vim: set ft=zsh:
