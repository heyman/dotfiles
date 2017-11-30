# fix pretty ls
alias ls="ls -Gl"

# path
export PATH=/usr/local/bin:$PATH

# add ruby bin path to PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

# add GNU gettext, installed through homebrew, to PATH (for Django translations management commands to work)
export PATH=$PATH:/usr/local/Cellar/gettext/0.19.2/bin/

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

# Ruby rbenv
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Change Terminal background when SSH:ing
ssh(){
    #!/bin/sh

    HOSTNAME=`echo $@ | sed s/.*@//`

    set_bg () {
      osascript -e "tell application \"Terminal\" to set background color of window 1 to $1"
    }
    
    set_theme () {
      osascript -e "tell application \"Terminal\" to set current settings of window 1 to settings set \"$1\""
    }

    on_exit () {
      set_theme "Pro"
    }
    #trap on_exit EXIT

    case $HOSTNAME in
      production1|production2|production3) set_them "SSH" ;;
      *) set_theme "SSH" ;;
    esac

    /usr/bin/ssh "$@"
    on_exit;
}

export NVM_DIR="/Users/heyman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
