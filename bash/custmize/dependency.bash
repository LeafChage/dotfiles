#!/bin/bash

depends="
rg
peco
jq
fzf
op
"

check_installed() {
    type "$1" 1>/dev/null 2>/dev/null
}

echo  "* Let's check dependency..."
for depend in ${depends}; do
    check=0
    check_installed "$depend" 2>&1 > /dev/null || check=$?
    if [ "$check" -eq "0" ]; then
        echo "* O $depend"
        continue
    fi
    echo "* X $depend"
done
echo  "* Finished!!"
