export DOTFILE_BASH_PATH=$(dirname $BASH_SOURCE)
export DOTFILE_PATH="$DOTFILE_BASH_PATH/../"

export NVIM_CONFIG_DIR=${NVIM_CONFIG_DIR:="$DOTFILE_PATH/vim/nvim/nvim"}
export DOTFILE_EMOJI=${DOTFILE_EMOJI:=0}
export DOTFILE_LOCAL=${DOTFILE_LOCAL:=1}
export DOTFILE_MEMO=${DOTFILE_MEMO:=1}

##
## make bin directory
##
test ! -d $HOME/.dotfilebins && mkdir "$HOME/.dotfilebins"

setting_files="
$DOTFILE_BASH_PATH/custmize/env.bash
$DOTFILE_BASH_PATH/custmize/dependency.bash
$DOTFILE_BASH_PATH/custmize/functions.bash
$DOTFILE_BASH_PATH/custmize/completion.bash
$DOTFILE_BASH_PATH/custmize/keymaps.bash
$DOTFILE_BASH_PATH/custmize/ps1.bash
"

echo  "Let's start setting..."
for setting_file in ${setting_files}; do
    if [[ -e "$setting_file" ]]; then
        source "$setting_file"
    else
        echo "no file $setting_file"
    fi
done
echo  "Finished!!!"

