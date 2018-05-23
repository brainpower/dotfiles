# Filename:      .zsh/functions
# Purpose:       some functions for zsh
# Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
# License:       This file is licensed under the GPL v2.
################################################################################
# This file gets sourced by my .zshrc
################################################################################

###
# add "${BP_FUNCTIONS_DIR}" to ${fpath}
##
mkdir -p "${BP_FUNCTIONS_DIR}"
fpath=("${BP_FUNCTIONS_DIR}" $fpath)

# bp: check if we're running Arch Linux
function isarch(){
  grep -q 'DISTRIB_ID=Arch' /etc/lsb-release
}

# restart zsh
restart () {
    exec $SHELL $SHELL_ARGS "$@"
}

# compile all zsh files inside ZDOTDIR
bp_zrecompile(){
	for file in "${ZDOTDIR}"/*.zsh "${ZDOTDIR}/.zshrc" "${ZDOTDIR}/.zshrc.pre"; do
		zcompile "$file"
	done
}

# strip root dir from tar when extracting.
# This is useful, if I have tar: firefox/firefox
# and want to have /opt/firefox-aurora/firefox
# just do cd /opt/firefox-aurora; tar-noroot xf ff.tar.bz2; and done
tar-noroot(){
  tar "$@" --strip-components=1
}

## List all occurrences of programm in current PATH
plap() {
    emulate -L zsh
    if [[ $# = 0 ]] ; then
        echo "Usage:    $0 program"
        echo "Example:  $0 zsh"
        echo "Lists all occurrences of program in the current PATH."
    else
        ls -l ${^path}/*$1*(*N)
    fi
}

## Find out which libs define a symbol
lcheck() {
	emulate -L zsh
    if [[ -n "$1" ]] ; then
        nm -go /usr/lib/lib*.a 2>/dev/null | grep ":[[:xdigit:]]\{8\} . .*$1"
    else
        echo "Usage: lcheck <function>" >&2
    fi
}

# bp: ...
get_public_ip(){
	echo `curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"`;
}

isarch && function pacgroups () {
	LANG=C pacman -Si | grep '^Groups' | grep -v 'None' | awk -F: '{ print $2 }' | sed 's/^ //;s/  /\n/g' | sort -u
}

## save/load gnome-terminal "sessions"
gt-savef() { gnome-terminal --save-config=$@; }
gt-loadf() { gnome-terminal --load-config=$@; }

## Some quick Perl-hacks aka /useful/ oneliner
getlinks ()   { perl -ne 'while ( m/"((www|ftp|http):\/\/.*?)"/gc ) { print $1, "\n"; }' $* }
gethrefs ()   { perl -ne 'while ( m/href="([^"]*)"/gc ) { print $1, "\n"; }' $* }

coin() { echo $(expr $(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9~!@#$%^&*-_' | fold -w 1 | head -n 1|od -t d| head -n1|awk '{print $2}') % 2); }


xrsync (){
	emulate -L zsh
	rsync -aPXh --info=progress2 "$@"
}

stderred() {
	if [[ $1 == "on" ]]; then
		xsource '/usr/share/stderred/stderred.sh'
	elif [[ $1 == "off" ]]; then
		unset LD_PRELOAD
	else
		printf "Usage: $0 <on|off>"
	fi
}

# vim: set ft=zsh:
