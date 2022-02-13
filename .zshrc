# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# Update automatically without asking
zstyle ':omz:update' mode auto


# Run oh-my-zsh
plugins=(git kubectl)
export ZSH="/home/tal/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# Update PATH
export PATH=$PATH:/home/tal/.local/bin


# Completion of kubectl, helm and kind
source <(kubectl completion zsh)
source <(helm completion zsh)
kind completion zsh > /usr/local/share/zsh/site-functions/_kind
compdef _kind kind


# Each tab shall have a distint history
unsetopt share_history

# Disable sounds
unsetopt beep


# Set robusta home
export ROBUSTA=~/git/robusta


# Set umask
umask 0022


# Google Cloud SDK: add to path and add completion
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi


# Tools
alias tmpdir=$(mktemp -d -t wd-XXXXXXXXXX)


# Docker extentions
#alias docker-rm="docker ps --all -q -f status=exited | xargs --no-run-if-empty docker rm -f"

alias docker-clean-containers="docker container prune -f"
alias docker-clean-images="docker image prune -af"
alias docker-clean-networks="docker network prune -f"
alias docker-clean-volumes="docker volume prune -f"
alias docker-clean="docker-clean-containers && docker-clean-images && docker-clean-networks && docker-clean-volumes"


export PATH="$HOME/.poetry/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi

# Customize prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
