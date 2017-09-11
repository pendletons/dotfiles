source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
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
EOBUNDLES

antigen bundle supercrabtree/k # better directory listings
antigen bundle zsh-users/zsh-autosuggestions # Fish-like auto suggestions

antigen apply
