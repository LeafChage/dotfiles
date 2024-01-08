if type fzf 1>/dev/null 2>/dev/null; then
    fuzzy_cd() {
        f="$(fzf)"
        dir="$(dirname "$f")"
        cd "$dir" || return
    }
    bind -x '"\C-f": fuzzy_cd'
fi
