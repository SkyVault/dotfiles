execute() {
    $1 # &> /dev/null
    print_result $? "${2:-$1}"
}

print_error() {
    printf "\e[0;31m[✖] $1 $2\e[0m\n"
}

print_info() {
    printf "\n\e[0;35m$1\e[0m\n\n"
}

print_question() {
    printf "\e[0;33m[?] $1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m[✔] $1\e[0m\n"
}

DOTFILES_DIR="$HOME/Repos/dotfiles"
CONFIG_DIR="$HOME/.config"

# Set up custom directories
mkdir -p $HOME/Repos
mkdir -p $HOME/Projects
mkdir -p $HOME/Applications


mkdir -p "$CONFIG_DIR"

for cfg in "$DOTFILES_DIR/config"/*; do
  src="$cfg"
  target="$CONFIG_DIR/$(printf "%s" "$cfg" | sed "s/.*\/\(.*\)/\1/g")"
  execute "ln -sf $src $target" "$src -> $target"
  execute "rm -rf $target/$(basename -- $target)"
done

execute "ln -sf $DOTFILES_DIR/zshrc $HOME/.zshrc"
execute "ln -sf $DOTFILES_DIR/zalias $HOME/.zalias"
execute "ln -sf $DOTFILES_DIR/zprofile $HOME/.zprofile"
execute "ln -sf $DOTFILES_DIR/zshenv $HOME/.zshenv"
execute "ln -sf $DOTFILES_DIR/app.sh $HOME/Applications/app.sh"

execute "ln -sf $DOTFILES_DIR/set-displays.sh $HOME/.local/bin/set-displays"

print_info ":: Dot files have been deployed ::"
