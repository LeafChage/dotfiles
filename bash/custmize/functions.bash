if type postgres >/dev/null 2>&1; then alias psgl='postgres'; fi

###
### Editor
###
if type emacs >/dev/null 2>&1; then
    alias emacs='emacs -nw'
    alias e='emacs'
fi
if type nvim >/dev/null 2>&1; then
    alias v='vim'
    alias vim='nvim'
fi

###
### lisp
###
if type sbcl >/dev/null 2>&1; then alias sbcl='rlwrap sbcl'; fi
if type ecl >/dev/null 2>&1; then alias ecl='rlwrap ecl'; fi
if type gosh >/dev/null 2>&1; then alias gosh='rlwrap gosh'; fi
if type guile >/dev/null 2>&1; then alias guile='rlwrap guile'; fi

###
### clip
###
if type clip.exe >/dev/null 2>&1; then alias pbcopy='clip.exe'; fi

if ls -aG >/dev/null 2>&1 ; then alias ls='ls -aG'; fi
alias ll='ls -lh'

alias pjroot="git rev-parse --show-toplevel"

functions="
$DOTFILE_BASH_PATH/custmize/functions/tmp.bash
$DOTFILE_BASH_PATH/custmize/functions/fzf.bash
$DOTFILE_BASH_PATH/custmize/functions/ip.bash
$DOTFILE_BASH_PATH/custmize/functions/some.bash
$DOTFILE_BASH_PATH/custmize/functions/git.bash
"
for fn in ${functions}; do
    test -e "$fn" && source "$fn"
done


