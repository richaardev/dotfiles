export PATH=$PATH:$HOME/bin

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Loads Starship
eval "$(starship init zsh)"