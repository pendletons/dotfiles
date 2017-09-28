# makes color constants available
autoload -U colors
colors

expect ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=116"

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1
