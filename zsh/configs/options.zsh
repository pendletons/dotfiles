# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# disable autocorrect
unsetopt correct

plugins=(osx git gitfast rails ruby brew bundler gem tmux tmuxinator autojump history)

# Overcommit
export GIT_TEMPLATE_DIR=`overcommit --template-dir`

# IEx shell history
export ERL_AFLAGS="-kernel shell_history enabled"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
