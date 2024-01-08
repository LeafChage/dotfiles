#!/bin/bash

depends="
rg
lua
peco
jq
memol
cargo
envy
fzf
"

installer_path() {
    echo "$DOTFILE_BASH_PATH/custmize/installer/$1.bash"
}

echo  "* Let's check dependency..."
for depend in ${depends}; do
    installer="$(installer_path "$depend")"
    if [ ! -e "$installer" ]; then
        echo "* X $depend"
        continue
    fi

    check=0
    bash "$installer" check 2>&1 > /dev/null || check=$?
    if [ "$check" -eq "0" ]; then
        echo "* O $depend"
        continue
    fi

    result=0
    bash "$installer" install 2>&1 > /dev/null || result=$?
    if [ "$result" -eq "0" ]; then
        echo "* O $depend"
    else
        echo "* X $depend"
    fi
done
echo  "* Finished!!"
