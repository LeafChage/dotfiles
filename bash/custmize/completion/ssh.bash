#!/bin/bash
SSH_CONFIG=~/.ssh/config

sshlist() {
    # .ssh/configからHost名だけとってきて表示
    awk '$1=="Host" {print $2}' "$SSH_CONFIG"
}

make_completion_words() {
    if [ "$COMP_CWORD" = "1" ]; then
        ssh_list=`sshlist | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g'`
        COMPREPLY=($(compgen -W "${ssh_list}" -- "${COMP_WORDS[$COMP_CWORD]}"))
    fi
}

complete -o bashdefault -o default -o nospace -F make_completion_words ssh
