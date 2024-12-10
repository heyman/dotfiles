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

# git editor
export GIT_EDITOR=emacs

# git bash completion (also needed for Docker completion)
autoload -U compinit && compinit

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

# python/django command shortcuts
alias pt="python -m unittest"
alias pm="python manage.py"
alias pms="python manage.py shell_plus --use-pythonrc"

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py

# allow comments using `#` directly in terminal
set -k

# Make Option+Left, Option+Right, Option+Backspace keys not jump over or kill whole 
# paths /such/as/this, but instead stop at each forward slash
# More info here: https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
#WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # <-- NO SLASH here

# zsh seems to have OK defaults if no WORDCHARS is specified, but if we DO
# specify them like above, it doesn't work
WORDCHARS=''

# custom background when SSH:ing or fab:ing
source ~/projects/dotfiles/terminal-bg.sh

# Homebrew (arm64) path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew x64 alias
alias brew64=/usr/local/bin/brew

# Set DYLD_FALLBACK_LIBRARY_PATH to make python function ctypes.util.find_library() find Homebrew libraries
# See: https://stackoverflow.com/a/3172515/27406
# And: https://stackoverflow.com/a/75048449/27406
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib

# Set custom env var to be able to do a tricky workaround for MacOS SIP shenanigans
# See: https://briandfoy.github.io/macos-s-system-integrity-protection-sanitizes-your-environment/
export MY_DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH


# initialize atuin
eval "$(atuin init zsh --disable-up-arrow)"

# rbenv
eval "$(rbenv init -)"

# pyenv
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv virtualenv wrapper
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=~/projects
pyenv virtualenvwrapper

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java / Android
[ -s "/usr/libexec/java_home" ] && export JAVA_HOME=$(/usr/libexec/java_home -v 17)
# Android SDK
[ -s "/Users/heyman/Library/Android/sdk" ] && export ANDROID_HOME=/Users/heyman/Library/Android/sdk
[ -s "/Users/heyman/Library/Android/sdk" ] && export ANDROID_SDK_ROOT=/Users/heyman/Library/Android/sdk

###-tns-completion-start-###
if [ -f /Users/heyman/.tnsrc ]; then 
    source /Users/heyman/.tnsrc 
fi
###-tns-completion-end-###
