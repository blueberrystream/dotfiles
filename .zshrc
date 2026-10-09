# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#586e75'

zstyle :omz:update mode reminder
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  macports
  mise
  ssh-agent
  gpg-agent
  fzf
  sudo
  command-not-found
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# alias and function
alias ll='eza -lah --icons --group-directories-first --git'

if (( $+commands[peco] && $+commands[ghq] )); then
  function g() {
    local repo=$(ghq list | peco)
    [[ -n $repo ]] && cd "$(ghq root)/$repo"
  }

  function gs() {
    local repo=$(ghq list | peco)
    [[ -n $repo ]] && echo "$(ghq root)/$repo"
  }
fi
