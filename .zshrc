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
# git editor
export GIT_EDITOR=emacs


# precmd() function that preserves any existing precmds
# -----------------
precmd_hook() {
  # Set tab title to last part of $CWD in iterm2
  eval 'echo -ne "\033]0;${PWD##*/}\007"'
  
  # Activate virtualenv if no virtualenv is active and .venv file exists
  if (( !${+VIRTUAL_ENV} )) && [[ -f .venv ]] then
    workon `cat .venv`;
  fi
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions precmd_hook)
# -----------------


# Aliases
alias ls='ls -Gl'
alias ..='cd ..'

# django manage command shortcuts
alias pm="python manage.py"
alias pms="python manage.py shell_plus --use-pythonrc"

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py

# allow comments using `#` directly in terminal
set -k

# Make Option+Left, Option+Right, Option+Backspace keys not jump over or kill whole 
# paths /such/as/this, but instead stop at each forward slash
# More info here: https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # <-- NO SLASH here

# custom background when SSH:ing or fab:ing
source ~/projects/dotfiles/terminal-bg.sh

# rbenv
eval "$(rbenv init -)"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pyenv virtualenv wrapper
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=~/projects
pyenv virtualenvwrapper

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
