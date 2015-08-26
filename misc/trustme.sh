#!/bin/sh 

pubkey="$HOME/.ssh/id_rsa.pub"
test -z "$1" && exit 1
if test -f "$pubkey"; then
        test -r "$pubkey" || exit 1 
else
        ssh-keygen
fi
( 
        echo ; 
        cat "$pubkey";
        echo ;
) | ssh "$1" "(mkdir -p .ssh ; cat >> .ssh/authorized_keys ; chmod 700 .ssh ; chmod 600 .ssh/authorized_keys)"

#ssh "$1" "cat >> .ssh/authorized_keys"
