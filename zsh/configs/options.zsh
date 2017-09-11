# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# plugins
plugins=(git gitfast bundler osx rails ruby tmux tmuxinator)

# Allow [ or ] whereever you want
unsetopt nomatch
