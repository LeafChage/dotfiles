#!/bin/bash
set -euo pipefail

install_mac() {
    if type brew 1>/dev/null 2>/dev/null; then
        brew install lua
    else
        echo "I don't have brew cmd" 1>&2
        exit 1
    fi
}

install_linux() {
    if type apk 1>/dev/null 2>/dev/null; then
        apk add lua5.4
        mv /usr/bin/lua5.4 /usr/bin/lua
    elif type apt 1>/dev/null 2>/dev/null; then
        apt install -y lua5.4
        mv /usr/bin/lua5.4 /usr/bin/lua
    else
        echo "I don't have apk cmd" 1>&2
        exit 1
    fi
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
            type lua 1>/dev/null 2>/dev/null
            ;;
        "update" )
            exit 1 ;;
        * )
            exit 1 ;;
    esac
}

main "${@}"
