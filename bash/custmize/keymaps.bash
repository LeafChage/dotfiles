keymaps="
$DOTFILE_BASH_PATH/custmize/keymaps/cd.bash
$DOTFILE_BASH_PATH/custmize/keymaps/search.bash
"

for keymap in ${keymaps}; do
    test -e "$keymap" && source "$keymap"
done


