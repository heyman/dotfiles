# fix pretty ls
alias ls="ls -Gl"

# path
export PATH=/usr/local/bin:$PATH

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

# virtualenv wrapper
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=~/projects
source virtualenvwrapper.sh

# git
export GIT_EDITOR=emacs

# fix problems with setuptools, and other python stuff, together with OSX terminal
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# python commands (for tripbirds makefiles)
export PYTHON=python

# django manage command shortcut
alias pm="python manage.py"
alias pms="python manage.py shell_plus --use-pythonrc"

# heroku client alias
alias h="heroku"

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py

## Ruby RVM (copied from .bash_profile)
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
