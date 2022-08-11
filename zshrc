

export TERM="xterm-256color"

# load our own completion functions
fpath=(~/.zsh/completion $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export GPG_TTY=$(tty)

# ruby 2.7
#export RUBYOPT='-W:no-deprecated -W:no-experimental'
export LESS="-RFX"

eval $(thefuck --alias poo)

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$PATH"

# color-ls
# source $(dirname $(gem which colorls))/tab_complete.sh

eval "$(pyenv init -)"

[[ -f /opt/homebrew/share/antigen/antigen.zsh ]] && source /opt/homebrew/share/antigen/antigen.zsh
[[ -f /usr/local/share/antigen/antigen.zsh ]] && source /usr/local/share/antigen/antigen.zsh
antigen init ~/.antigenrc

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.bin:$PATH"
source /usr/local/opt/asdf/asdf.sh
