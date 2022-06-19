# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# disable autocorrect
unsetopt correct

plugins=(osx git gitfast rails ruby brew bundler gem tmux tmuxinator autojump fasd history zsh-asdf-direnv)

# Overcommit
#export GIT_TEMPLATE_DIR=`overcommit --template-dir`

# IEx shell history
export ERL_AFLAGS="-kernel shell_history enabled"

export EDITOR=/usr/local/bin/vim

# fzf file opening
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

# make bundler faster
CORES=`sysctl -n hw.ncpu 2>/dev/null || nproc` # mac & linux
MAKEFLAGS="-j$CORES"; export MAKEFLAGS
BUNDLE_JOBS="$CORES"; export BUNDLE_JOBS

. $HOME/.asdf/asdf.sh
