
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# initialize powerlevel10k
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# git bash completion
autoload -U compinit && compinit # <-- needed for git-completion script to work on zsh
source ~/projects/dotfiles/misc/git-completion.bash

# Aliases
alias ls='ls -Gl'
alias ..='cd ..'
alias ...='cd ../..'
# django manage command shortcut
alias pm="python manage.py"
alias pms="python manage.py shell_plus --use-pythonrc"

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py

# allow comments using `#` directly in terminal
set -k

# custom background when SSH:ing or fab:ing
source ~/projects/dotfiles/terminal-bg.sh

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# pyenv virtualenv wrapper
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=~/projects
pyenv virtualenvwrapper
