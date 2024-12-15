# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook 
add-zsh-hook chpwd chpwd_recent_dirs


export PS1='%~ %# '

# xmodmap キーバインド
xmodmap ~/.Xmodmap
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# python
## rye
source "$HOME/.rye/env"

# Rust
. "$HOME/.cargo/env"
source /opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
