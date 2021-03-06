source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz compinit && compinit
source ~/.config/zsh/aliases

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' +'l:|=* r:|=*'

setopt auto_cd
setopt complete_in_word
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack

autoload -Uz vcs_info
precmd() {
  precmd(){
    vcs_info
    echo
  }
}
zstyle ':vcs_info:git:*' formats '--> %b'

setopt prompt_subst
export RPROMPT='%F{yellow}%D{%L:%M}%f'
export PROMPT='%F{yellow}%1d ${vcs_info_msg_0_}
%f '

export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_COLORS='#fafaf5'
