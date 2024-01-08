## $ some  5 -- echo "hello world"
## > hello world
## > hello world
## > hello world
## > hello world
## > hello world
function some() {
    count=0
    for _ in "$@"; do
        count=$((count+1))
    done

    cmd=${*:3:count}

    for _ in $(seq 1 "$1") ; do
        $cmd
    done
}
