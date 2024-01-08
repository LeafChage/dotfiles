#!/bin/bash
set -euo pipefail

main() {
    subcmd="${1:-nothing}"
    case "$subcmd" in
        "install" )
            which cargo || echo "you need to install cargo first"
            cargo install env-y
            exit 0
            ;;
        "check" )
            type envy 1>/dev/null 2>/dev/null
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
