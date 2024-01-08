#!/bin/bash

set -euo pipefail

error() {
    echo "$1" 1>&2;
    exit 1
}

install() {
    curl --silent "$2" > "$1"
    chmod +x "$1"
}

update() {
    exit 1;
}

check() {
    if [ -e "$1" ]; then
        echo "ok"
    else
        echo "no"
    fi
}

main() {
    subcmd="${1:-nothing}"
    case "$subcmd" in
        "install" )
            if [ -z "$2" ]; then error "required output path"; fi
            if [ -z "$3" ]; then error "required github_url"; fi
            install "$2" "$3"
            exit 0 ;;
        "check" )
            if [ -z "$2" ]; then error "required output path"; fi
            check "$2"
            exit 0 ;;
        "update" )
            update
            exit 0 ;;
        * )
            exit 1 ;;
    esac
}

main "${@}"
