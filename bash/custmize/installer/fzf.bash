#!/bin/bash
set -euo pipefail

main() {
    subcmd="${1:-nothing}"
    case "$subcmd" in
        "install" )
            which git || echo "you need to install git first"
            if [ -d /tmp/fzf ]; then rm -rf  /tmp/fzf; fi
            git clone --depth 1 https://github.com/junegunn/fzf.git /tmp/fzf
            /tmp/fzf/install --bin
            mv /tmp/fzf/bin/fzf $HOME/.dotfilebins/fzf
            exit 0
            ;;
        "check" )
            type fzf 1>/dev/null 2>/dev/null
            ;;
        "update" )
            exit 0
            ;;
        * )
            exit 1
            ;;
    esac
}

main "${@}"
