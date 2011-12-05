# fix pretty ls
alias ls="ls -Gl"

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
