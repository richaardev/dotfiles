export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/snap/bin

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# History things
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
