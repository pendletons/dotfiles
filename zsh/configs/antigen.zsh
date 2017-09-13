source /usr/local/share/antigen/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
  brew
  bundler
  common-aliases
  fast-syntax-highlighting
  git # required for other bundles
  gitfast
  git-aliases
  osx
  rails
  ruby
  tmux
  tmuxinator
  wd
EOBUNDLES

antigen bundle Tarrasch/zsh-bd # navigate back skipping parent directories
antigen bundle supercrabtree/k # better directory listings
antigen bundle zsh-users/zsh-autosuggestions # Fish-like auto suggestions
antigen bundle zdharma/history-search-multi-word # multi-word history matching

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply
