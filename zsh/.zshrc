# Filename:      .zshrc
# Purpose:       config file for zsh (z shell), extending the grml zsh config
# Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
################################################################################
#
# This file is intended to extend the grml zshrc, as found in the grml-etc-core
# repository or in the grml-zsh-config package of Arch Linux.
#
# The recomended way of using this zshrc is to put it and all accompanying files
# in a subfolder and set ZDOTDIR in ~/.zshenv accordingly.
#
# If you've installed grml's zshrc as '.zshrc' in your home directory,
# rename it to .zshrc.grml and name this file '.zshrc'.
# If you've installed grml's zshrc to /etc/zsh, you've got nothing to worry about.
#
# If you want to put this file in /etc/zsh to make it avaiable for all users,
# name it 'zshrc.local' and put the accompanying in /etc/zsh too.
# I didn't test that kind of setup, if problems arise, tell me.
#
# Of course, one could put it anywhere else,
# just make sure grml's zshrc is sourced before this file
# and all accompanying files are inside $ZDOTDIR.
#
# This file wont be sourced entirely if grml's zshrc is not detected!
#
################################################################################

# check if we're in /etc or not
if [[ "${(%):-%N}" =~ "^/etc/zsh/.*" ]]; then
	BPZDIR="/etc/zsh"
else
	BPZDIR="${ZDOTDIR:-$HOME}"
fi

# if env indicates fbterm, set TERM accordingly
if [ "$FBTERM" = 1 ]; then
	export TERM=fbterm
fi

###
# hasgrml() - GRML zshrc loaded or not?
###
function has_grml(){
	[[ -n ${GRML_OSTYPE+x} ]]
}

###
# check for grml zshrc,
# if not sourced already, source it now.
# if .zshrc.grml doesn't exist, do nothing
##
if ! has_grml; then
  if [[ -r "${BPZDIR}/.zshrc.grml" ]]; then
    source "${BPZDIR}/.zshrc.grml"
  fi
fi

# grml always sets COLORTERM=yes, overwriting terminals that set it to truecolor.
# Undo this by restoring the previous value, if there was one.
if [[ -n "$COLORTERM_SAVED" ]]; then
	# restore COLORTERM to correct value
	export COLORTERM="$COLORTERM_SAVED"
	unset COLORTERM_SAVED
fi

# enable thefuck if available
if [[ -x /usr/bin/thefuck ]]; then
	eval $(thefuck --alias)
	alias fuck-it='export THEFUCK_REQUIRE_CONFIRMATION=False; fuck; export THEFUCK_REQUIRE_CONFIRMATION=True'
fi


###
# sourcing personal files
##

# bp: import global variables from this file
xsource "${BPZDIR}/envvars.zsh"

# bp: import aliases from this file
xsource "${BP_ALIASES}"

# bp: import small functions from this file, put larger ones into ${BP_FUNCTIONS_DIR}
xsource "${BP_FUNCTIONS}"

xsource "${BP_HASHES}"

xsource "${BP_PROFILES}"

has_grml && xsource "${BP_PROMPT}"

# source stderred if avaiable
#stderred on

###
# sourcing 3rdparty helpers and plugins
##

# bp: archlinux-specific command not found handling, requires pkgfile
xsource /usr/share/doc/pkgfile/command-not-found.zsh

# bp: source some oh-my-zsh plugins
#xsource ~/.opt/oh-my-zsh/plugins/colorize/colorize.plugin.zsh

# syntax highlighting
xsource /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


###
# set some options
##

# bp: make pushd not display the whole stack every time it's used
setopt PUSHD_SILENT

setopt GLOB_STAR_SHORT

# bp: don't share history over instances of zsh
is4 && setopt noshare_history
is4 && setopt INC_APPEND_HISTORY

# bp: dont remove duplicates from history
#is4 && setopt nohistignorealldups

# bp: don't ignore commands in histroy preceded by a space
#setopt nohistignorespace

# bp: don't rehash, whenever a command completion is attempted
#setopt nohash_list_all

# bp: don't insert sections on auto-completeing man pages
zstyle ':completion:*:manuals.*'  insert-sections   false

zstyle ':acceptline:default' nocompwarn true


# if grml is not loaded, zcomp cache has not been initialized, do it now.
if ! has_grml; then
	GRML_COMP_CACHE_DIR=${GRML_COMP_CACHE_DIR:-${ZDOTDIR:-$HOME}/.cache}
	if [[ ! -d ${GRML_COMP_CACHE_DIR} ]]; then
		command mkdir -p "${GRML_COMP_CACHE_DIR}"
	fi
	zstyle ':completion:*' use-cache  yes
	zstyle ':completion:*:complete:*' cache-path "${GRML_COMP_CACHE_DIR}"
fi

## set command prediction from history, see 'man 1 zshcontrib'
is4 && zrcautoload predict-on && \
zle -N predict-on         && \
zle -N predict-off        && \
bindkey "^X^Y" predict-on && \
bindkey "^X^X" predict-off
#predict-on


## ctrl-s will no longer freeze the terminal.
stty erase "^?"
stty stop '' -ixoff

## END OF FILE #################################################################
