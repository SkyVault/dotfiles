if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH=/home/dneumann/.nimble/bin:$PATH
export PATH=/home/dneumann/Applications:$PATH
export PATH=/home/dneumann/Applications/lua-server/bin/:$PATH
export PATH=/home/dneumann/.local/share/JetBrains/Toolbox/scripts/:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
