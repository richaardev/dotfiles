export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/snap/bin:$PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

source ~/.config/zsh/aliases.zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]] then
  export ZSH="$HOME/.oh-my-zsh"

  plugins=(starship zoxide git asdf direnv eza docker node npm golang gh)

  source $ZSH/oh-my-zsh.sh
fi

zinit load zsh-users/zsh-autosuggestions
zinit load zdharma-continuum/fast-syntax-highlighting

if [[ -d "$HOME/.tmuxifier" ]] then
  export PATH="$HOME/.tmuxifier/bin:$PATH"

  if command -v tmuxifier &> /dev/null; then
    eval "$(tmuxifier init -)"
  fi
fi

