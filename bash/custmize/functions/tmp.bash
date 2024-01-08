function tmp() {
    cd "$(mktemp -d)" || return
}
