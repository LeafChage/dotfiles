function gitbranches() {
    # カレントディレクトリのbranchの情報が取得できます。
    branch=$(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
    if [ -n "$branch" ]; then
        echo "${branch}"
    fi
}

