function vimf() {
    nvim "$(fzf --preview 'cat {}')"
}

function copycat() {
    f="$(fzf --preview 'cat {}')"
    echo "$f"
    cat "$f"
    cat "$f" | pbcopy
}
