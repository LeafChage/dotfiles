#!/bin/bash
set -euo pipefail

install() {
    curl https://sh.rustup.rs -sSf -o /tmp/rustup.sh
    cat /tmp/rustup.sh
    read -r -p "ok? (y/N): " yn
    case "$yn" in
        [yY]*)
            sh /tmp/rustup.sh
            ;;
        *)
            ;;
    esac
}

main() {
    subcmd="${1:-nothing}"
    case "$subcmd" in
        "install" )
            install
            ;;
        "check" )
            type cargo 1>/dev/null 2>/dev/null
            ;;
        "update" )
            exit 1 ;;
        * )
            exit 1 ;;
    esac
}

main "${@}"
