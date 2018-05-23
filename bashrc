# File: ~/.bashrc
####
# switch to zsh if available.
# use this if you cant use chsh to switch your default shell
if [ -x "$(which zsh)" ] && [ ! "$ZSH_VERSION" ]; then
  exec $(which zsh) # $PWD
else
  if [ "$ZSH_VERSION" ]; then
    echo "Already running zsh version $ZSH_VERSION"
  else
    echo "Zsh executeable not found. Starting bash..."
  fi
fi

export EDITOR=vim
