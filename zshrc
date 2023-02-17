source "$HOME/.zalias"
autoload -U colors && colors

PROMPT="🌐 %{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %{$fg[yellow]%}%~ $%{$reset_color%} "

bindkey -e

# Bootstrap Znap
[[ -f $HOME/Repos/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $HOME/Repos/zsh-snap

source $HOME/Repos/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
