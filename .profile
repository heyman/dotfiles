# fix pretty ls
alias ls="ls -Gl"

# path
export PATH=/usr/local/Cellar/python/2.7.1/bin:/Users/jonatan/.gem/ruby/1.8/bin:/Developer/usr/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH

# git bash completion
source ~/misc/git-completion.bash

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

# set up better python history
export PYTHONSTARTUP=~/projects/dotfiles/.pythonrc.py
