# fix pretty ls
alias ls="ls -Gl"

# path
export PATH=/usr/local/bin:$PATH

# add ruby bin path to PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

# add GNU gettext, installed through homebrew, to PATH (for Django translations management commands to work)
export PATH=$PATH:/usr/local/opt/gettext/bin

# add PostgreSQL bin dir to path
#export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# git bash completion
source ~/projects/dotfiles/misc/git-completion.bash

# fix terminal prompt
# \d – Current date
# \t – Current time
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory, full path (ie: /Users/Admin/Desktop)
# $(__git_ps1 " (%s)") - Current git branch/state (in parethensis)
export PS1='\w $(__git_ps1 "(%s) ")§ '

# git
export GIT_EDITOR=emacs

# fix problems with setuptools, and other python stuff, together with OSX terminal
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# django manage command shortcut
alias pm="python manage.py"
alias pms="python manage.py shell_plus --use-pythonrc"

## heroku client alias
#alias h="heroku"

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py

# bash-completion (required by docker completion scripts)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Docker bash completion
source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion


## Ruby RVM (copied from .bash_profile)
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Ruby rbenv
eval "$(rbenv init -)"

# Pyenv
eval "$(pyenv init -)"

# virtualenv wrapper
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=~/projects
#source virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_PYTHON=$(pyenv which python)
#export VIRTUALENVWRAPPER_VIRTUALENV=$(pyenv which virtualenv)
pyenv virtualenvwrapper

source ~/projects/dotfiles/terminal-bg.sh


export NVM_DIR="/Users/heyman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.cargo/bin:$PATH"

# Fix for GPG signing of Git commits
export GPG_TTY=$(tty)

# Set JAVA_HOME
[ -s "/usr/libexec/java_homez" ] && export JAVA_HOME=$(/usr/libexec/java_home)
