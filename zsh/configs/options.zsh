# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] wherever you want
unsetopt nomatch

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
