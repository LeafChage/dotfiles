completions="
$DOTFILE_BASH_PATH/custmize/completion/git.bash
$DOTFILE_BASH_PATH/custmize/completion/ssh.bash
"

for c in ${completions}; do
    test -e "$c" && source "$c"
done


