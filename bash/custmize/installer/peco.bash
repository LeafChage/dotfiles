#!/bin/bash
set -euo pipefail

install_mac() {
    if type brew 1>/dev/null 2>/dev/null; then
        brew install peco
    else
        exit 1
    fi
}

install_linux() {
    cd /tmp
    curl -LO https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
    tar -zxvf ./peco_linux_amd64.tar.gz
    mv ./peco_linux_amd64/peco $HOME/.dotfilebins/peco
}

install() {
    if [ "$(uname)" == 'Darwin' ]; then
        install_mac
    elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
        install_linux
    else
        echo "Your platform ($(uname -a)) is not supported." 1>&2
        exit 1
    fi
}

main() {
    subcmd="${1:-nothing}"
    case "$subcmd" in
        "install" )
            install
            ;;
        "check" )
            type peco 1>/dev/null 2>/dev/null
            ;;
        "update" )
            exit 1 ;;
        * )
            exit 1 ;;
    esac
}

main "${@}"
