# Filename:      .zsh/prompt.zsh
# Purpose:       config file for my custom zsh prompt
# Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
################################################################################
# This file gets sourced by my .zshrc
################################################################################

###
# setting up my customized prompt
##

# bp: set exitcode used in prompt, it'll show if exitcode is not zero
BP_PROMPT_RETURN_CODE="%(?..[%?%1v]
)"

# bp: color to be used for username in prompt, if we're root
BP_PROMPT_ROOT_COLOR="${BP_PROMPT_ROOT_COLOR:-%B%F{red}}"

# bp: set the 'bp' prompt theme defaults to my liking:
#     these settings are used by the prompt_grml_precmd_worker to set up the prompt
zstyle ":prompt:bp:*:items:at"      pre '%B'
zstyle ":prompt:bp:*:items:host"    pre '%B'
zstyle ":prompt:bp:*:items:path"    pre ''
zstyle ":prompt:bp:*:items:percent" pre '%B'
zstyle ":prompt:bp:*:items:rc"      pre '%B%F{red}'

zstyle ":prompt:bp:*:items:at"      post '%b'
zstyle ":prompt:bp:*:items:host"    post '%b'
zstyle ":prompt:bp:*:items:path"    post ''
zstyle ":prompt:bp:*:items:percent" post '%b'
zstyle ":prompt:bp:*:items:rc"      post '%f%b'

zstyle ":prompt:bp:*:items:host"    token '%m'
zstyle ":prompt:bp:*:items:path"    token ':%40<..<%~%<< '
zstyle ":prompt:bp:*:items:rc"      token "$BP_PROMPT_RETURN_CODE"
zstyle ":prompt:bp:*:items:user"    token '%n'

# bp: help function gets called when using 'prompt -h bp'
function prompt_bp_help() {
	<<__EOF2__
	promt bp

		This is a variation of the grml prompt, see: prompt -h grml

		The main difference is the default value of the 'items' style. The rest
		behaves almost exactly the same, short of some changes to some items.
		Changed items include:

		- at            changed color
		- host          changed color, no space afterwards
		- path          changed color, colon before path
		- percent       changed color
		- rc            changed color, newline after the code

		Default items are:

		- left:         rc change-root user at host path vcs percent
		- right:        sad-smiley
__EOF2__
}



# bp: this adds the precmd function below as precmd hook
function prompt_bp_setup() {
	grml_prompt_setup bp
}

# bp: this will be bound to the precmd hook
function prompt_bp_precmd() {
	emulate -L zsh
	local grmltheme=bp
	local -a left_items right_items

	left_items=(rc change-root user at host path vcs percent)
	right_items=(sad-smiley)

	prompt_grml_precmd_worker
}

# bp: set colors for use in fallback prompt, taken from global zshrc
if is437; then
	BLUE="%F{blue}"
	RED="%F{red}"
	WHITE="%F{white}"
	NO_COLOR="%f"
elif zrcautoload colors && colors 2>/dev/null ; then
	BLUE="%{${fg[blue]}%}"
	RED="%{${fg_bold[red]}%}"
	WHITE="%{${fg[white]}%}"
	NO_COLOR="%{${reset_color}%}"
else
	BLUE=$'%{\e[1;34m%}'
	RED=$'%{\e[1;31m%}'
	WHITE=$'%{\e[1;37m%}'
	NO_COLOR=$'%{\e[0m%}'
fi

## bp: overriding some functions:

grml_prompt_fallback() { # TODO: test this
    setopt prompt_subst
    precmd() {
        (( ${+functions[vcs_info]} )) && vcs_info
    }

    p0="${BP_PROMPT_RETURN_CODE}${WHITE}${debian_chroot:+($debian_chroot)}"
    p1="${BP_PROMPT_USER}${NO_COLOR}@%m:%40<...<%B%~%b%<< "'${vcs_info_msg_0_}'"%# "
    if (( EUID == 0 )); then
        PROMPT="${BLUE}${p0}${RED}${p1}"
    else
        PROMPT="${RED}${p0}${BLUE}${p1}"
    fi
    unset p0 p1
}

# bp: add the theme to prompt_themes, if promptinit is avaiable
if zrcautoload promptinit && promptinit 2>/dev/null ; then
	prompt_themes+=( bp )
	# bp: keep the array sorted:
	prompt_themes=( "${(@on)prompt_themes}" )
else
	print 'Notice: no promptinit available :('
	grml_prompt_fallback
fi

# bp: now there's some action: setting my promt:
if is437; then # bp: well, only if zsh is modern enough

	if [[ $GRML_DISPLAY_BATTERY -gt 0  ]]; then
		zstyle ':prompt:grml:right:setup' items sad-smiley battery
		add-zsh-hook precmd battery
	fi

	if [[ "$TERM" == dumb ]] ; then # bp: if dumb, remove all "colors"
		zstyle ":prompt:bp:*:items:grml-chroot" pre ''
		zstyle ":prompt:bp:*:items:grml-chroot" post ' '
		for i in rc user path jobs history date time shell-level; do
			zstyle ":prompt:bp:*:items:$i" pre ''
			zstyle ":prompt:bp:*:items:$i" post ''
		done; unset i
		zstyle ':prompt:bp:right:setup' use-rprompt false
	elif (( EUID == 0 )); then # bp: we (probably) want another username color, if we're root
		zstyle ':prompt:bp:*:items:user' pre "$BP_PROMPT_ROOT_COLOR"
	fi

	# bp: now for real: set my prompt
	prompt bp
fi

# bp: unset things not needed anymore
unset BP_PROMPT_ROOT_COLOR BP_PROMPT_RETURN_CODE
unset BLUE RED WHITE NO_COLOR

