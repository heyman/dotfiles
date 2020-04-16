#!/bin/bash

# Change Terminal background when SSH:ing
ssh(){
    #!/bin/sh

    HOSTNAME=`echo $@ | sed 's/.*@//'`

    set_theme () {
      echo -e "\033]50;SetProfile=$1\a"
    }

    on_exit () {
      set_theme "Jonatan"
    }

    case $HOSTNAME in
      production1|production2|production3) set_theme "SSH" ;;
      *) set_theme "SSH" ;;
    esac

    /usr/bin/ssh "$@"
    on_exit;
}

# Change Terminal background when fab:ing
fab(){
    #!/bin/sh
    FABEXEC=`whence -p fab`

    set_theme () {
      echo -e "\033]50;SetProfile=$1\a"
    }

    on_exit () {
      set_theme "Jonatan"
    }

    set_theme "Fab"
    $FABEXEC "$@"
    on_exit;
}
