# Filename:      .zsh/envvars
# Purpose:       config file for shells
# Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
################################################################################
# This file gets sourced by my .zshrc
################################################################################

# the color stderred uses to highlight output on stderr
if zrcautoload colors && colors 2>/dev/null ; then
    STDERR_BW="${fg_bold[white]}"
    NO_COLOR="${reset_color}"
else
    STDERR_BW=$'\e[1;37m'
    NO_COLOR=$'\e[0m'
fi
export STDERRED_ESC_CODE="${STDERR_BW}"

# dpkg uses some of those
export EMAIL='YOU@example.com'
export DEBFULLNAME="YOU"
export DEBMAIL="$EMAIL"

# code run if an interactive python interpreter is started
# this one initializes readline and a readline based completer
export PYTHONSTARTUP=~/.opt/config/pythonrc

# common paths
export PATH="$PATH:$HOME/bin:$HOME/.opt/bin"

# add bin of ruby gems into PATH
if which ruby >/dev/null; then
	export PATH="$PATH:$(ruby -e "puts Gem.user_dir")/bin"
fi

# add current dir into java's classpath
export CLASSPATH="${CLASSPATH:+$CLASSPATH:}."

# always make with -jX (works with cmake, autotools and every makefile, that uses this var)
export MAKEFLAGS="$MAKEFLAGS -j$(( $(nproc) +1 ))"

# tell gcc >= 4.9 it can use colors
export GCC_COLORS=auto


# those are set as env vars so they can be "forwarded" via SSH's SendEnv and AcceptEnv
export GIT_AUTHOR_NAME="$(git config user.name)"
export GIT_AUTHOR_EMAIL="$(git config user.email)"
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

# gpg's interactive passwort input needs this
export GPG_TTY=$(tty)

# bp: set the username displayed in prompt
#     defaults to '%n' if empty or unset
#BP_PROMPT_USER='bp'


## some own files and dirs
BP_ALIASES="${BPZDIR}/aliases.zsh"
BP_FUNCTIONS="${BPZDIR}/functions.zsh"
BP_HASHES="${BPZDIR}/hashes.zsh"
BP_PROMPT="${BPZDIR}/prompt.zsh"
BP_PROFILES="${BPZDIR}/profiles.zsh"

BP_FUNCTIONS_DIR="${BPZDIR}/functions/"

if [[ "${BPZDIR}" == "${HOME}" ]]; then
	BP_FUNCTIONS_DIR="${BPZDIR}/.zsh_functions/"
fi

#
# some zsh settings

# bp: report about cpu-/system-/user-time of command after 30 seconds
REPORTTIME=30

# bp: turn off mail checking
MAILCHECK=0

# bp: override history (file) size
HISTSIZE=200000
SAVEHIST=200000

# bp: dont load locale from /etc/default/locale
ZSH_NO_DEFAULT_LOCALE=1

# bp: set format of time output
export TIMEFMT="%J
user: %*U system: %*S cpu: %P total: %*E"


## define word separators (for stuff like backward-word, forward-word, backward-kill-word,..)
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # the default
#WORDCHARS=.
WORDCHARS='*?_[]~=&;!#$%^(){}'
#WORDCHARS='${WORDCHARS:s@/@}'

## auto-logout. set timeout in seconds...
## ...and do not log out in some specific terminals:
if [[ "${TERM}" == ([Exa]term*|rxvt|dtterm|screen*) ]] ; then
    unset TMOUT
else
    TMOUT=1800
fi

# vim: set ft=zsh:
