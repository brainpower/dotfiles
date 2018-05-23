# Some dot-files from my home directory.

Those are by no means meant to just `git clone && install.sh`.
Look at them as an example of how it could be done, hints at what is possible.
Read the files, look up or find out what the settings do,
take what you need or want, discard what you don't
and create yor very own set of dotfiles.



These files are distributed in the hope that they will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

If not stated otherwise in the respective files,
all code inside the files is licensed under MIT license.
See COPYING file.
Files in mpv/scripts/ are an exception to this.


## A few words about the zshrc:

This .zshrc heavily depends on the [zshrc from the grml system] (http://grml.org/zsh),
it probably won't work at all without it.

### Locations and files


The recomended way of using this zshrc is to put it and all accompanying files
in a subfolder and set `$ZDOTDIR` in `~/.zshenv` accordingly.
All `.zsh*` files will be searched for and put in `$ZDOTDIR` and therefore wont pollute `$HOME` unneccessarily.

If you've installed grml's zshrc as `.zshrc` in your home directory,
rename it to `.zshrc.grml` and put it into `$ZDOTDIR`, if you use that else leave it in `$HOME`.

If you've installed grml's zshrc to `/etc/zsh`, you've got nothing to worry about.
You can do so using the official archlinux package `grml-zsh-config`
or the ubuntu package from this ppa: https://launchpad.net/~brainpower/+archive/bppa

If you'd want to put this zshrc in `/etc/zsh` to make it avaiable to all users,
name it `zshrc.local` and put the accompanying files in `/etc/zsh` too.
I didn't test that kind of setup, so you might encounter some problems.

Of course, you could put it anywhere else,
just make sure grml's zshrc is sourced before this zshrc
(or that it exists as `.zshrc.grml` in `$ZDOTDIR`)
and all accompanying files are inside `$ZDOTDIR`.

This file wont be sourced entirely if grml's zshrc is not detected!

The accompanying files are all optional.
There shouldn't be any errors if one is missing,
but the things contained or set up in them are not avaiable then, obviously.


### Features

* my own prompt (quite similar to grml default, but some details are different)
* some useful aliases, directory-hashes, functions and environment variables

Most of the aliases, hashes and env-vars probably wont be useful to you,
but they're included anyway to give you an idea of what's possible.

## A lot of words about the vimrc

This vimrc began with grml's vimrc as its base, but a lot more things were added later,
so grml's vimrc is but a small part of the vimrc now.
Many ideas for options, plugins and more came from various [vim-wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki) entries,
blogs, spf13-vim and a few other publicly shared vimrc's. I dont remeber all of them anymore.
If you want to be attributed for something I used, contact me and we'll talk about it.

### Locations and files

The .vim folder should reside in the home directory.
Everything vim stores to disc is put inside that or ~/.cache/vim/ .
vimrc and vimrc.addons are required, all other things are optional.
Vundle is used to manage Vim Add-Ons (or plugins if you like), so

    vim +PluginInstall +qall

is needed to install all plugins, if you want them.
For more info about Vundle and how to keep the Add-Ons up to date, see [Vundle](http://github.com/gmarik/Vundle.vim).

#### Neo vim

`init.vim` is symlinked to `vimrc`, so the folder can be used as `~/.config/nvim/`, too.

### Features

See plugins listed in vimrc.addons and their documentation.
Changes to their configuration are in the 'addon settings' section/fold of the vimrc.

I'll mention a few behaviors or features they introduce and are worth noting.
You can also have a look at the (yet incomplete) cheatsheet for this vimrc, to get an idea of what they do.
It's the `vimrc-cheatsheet.txt` file in the .vim folder.

* First of all, leader is set to `,`.

#### Features by addons:

* Whitespace at the end of lines is deleted automatically.
* YouCompleteMe provides `<Tab>` completion.
* NERDTree is toggled by `<C-e>`.
* CtrlP is activated by `<C-p>` (surprise!)
* brackets, parenthesis and quotes will be "autoclosed"
* Syntastic is used to highlight syntax errors
* UltiSnips snippets are triggered with `<C-j>`
* EasyTags manages generation and loading of tags
* eclim can be used for java projects and won't activate on c or cpp files

#### Vanilla features:

* folding by marker is default
* mouse support is enabled, can be toggled using `<F12>`
* 'The silver searcher', `ag`, will be used instead of `grep` if installed
* 'persistent undo' from grml's vimrc is enabled
* swp files are stored "globally" in `~/.cache/vim/swp/`
* all temporary stuff (undo history, viminfo, swap files, etc) is stored in `~/.cache/vim/`
* `,cs` clears search highlighting
* `,fc` jumps to git merge conflict markers
* `,q` toggles the quickfix list
* `<C-d>` duplicates a line in all modes, except visual where it duplicates the selection
* forgot to sudo? `:w!!`
* `<C-n>` and `<C-b>` switch buffers, `<C-n>` to next, `<C-b>` to previous
* `:Q`, `:W` and `:WQ` are `:q!`, `:w!` and `:wq!`
* double-click on a closed fold opens it

