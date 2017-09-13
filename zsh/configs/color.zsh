# makes color constants available
autoload -U colors
colors

export TERM="xterm-256color"

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1
