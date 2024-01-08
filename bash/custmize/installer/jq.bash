#!/bin/bash
set -euo pipefail

install_max() {
    echo "unimplemented" 1>&2
    exit 1
}

install_linux() {
    if type apk 1>/dev/null 2>/dev/null; then
        echo "unimplemented" 1>&2
        exit 1
    elif type apt 1>/dev/null 2>/dev/null; then
        echo "sudo apt install -y jq" 1>&2
        exit 1
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
            exit 1 ;;
        "check" )
            type jq 1>/dev/null 2>/dev/null
            ;;
        "update" )
            exit 1 ;;
        * )
            exit 1 ;;
    esac
}

main "${@}"
