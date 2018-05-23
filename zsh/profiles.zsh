
# do not re-execute profile init functions when profile is active already
zstyle ':chpwd:profiles:*' re-execute false

# AUR git commiter name profile
zstyle ':chpwd:profiles:'"$HOME"'/.aur/own(|/|/*)' profile AUR_GIT
chpwd_profiles

chpwd_profile_AUR_GIT() {
	[[ ${profile} == ${CHPWD_PROFILE}  ]] && return 1
	print "chpwd(): Switching to profile: $profile"

	# store old values
	pre_AUR_GIT_GIT_AUTHOR_NAME="$GIT_AUTHOR_NAME"
	pre_AUR_GIT_GIT_COMMITTER_NAME="$GIT_COMMITTER_NAME"

	export GIT_AUTHOR_NAME="oi_wtf"
	export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
}
chpwd_leave_profile_AUR_GIT() {
	print "chpwd(): Leaving profile: AUR_GIT"

	export GIT_AUTHOR_NAME="$pre_AUR_GIT_GIT_AUTHOR_NAME"
	export GIT_COMMITTER_NAME="$pre_AUR_GIT_GIT_COMMITTER_NAME"
}



