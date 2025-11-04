eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
