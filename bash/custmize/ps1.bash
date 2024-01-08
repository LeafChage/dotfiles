# TerminalName
##
## branch name
##
PS1_BRANCH=''
if type gitbranches 1>/dev/null 2>/dev/null; then
    gitbranch() {
        b=`gitbranches`
        if [ -n "$b" ]; then
            echo "[$b]"
        fi
    }
    PS1_BRANCH='\[\e[1;32m\]$(gitbranch)\[\e[0m \]'
fi

##
## Task
##
PS1_TASK=""
if [ "$DOTFILE_MEMO" = 1 ]; then
    if type memol 1>/dev/null 2>/dev/null; then
        task() {
            memol all -n 3 | sed "s/ (at: .*)/ \/ /g" | xargs
        }
        PS1_TASK='\e[36;1m $(task) \e[m'
    fi
fi

##
## Task
##
PS1_EMOJI="$ "
if [ "$DOTFILE_EMOJI" = 1 ]; then
    if [ "$DOTFILE_LOCAL" = 1 ]; then
        PS1_EMOJI='\[\e[1;32m\]🌱\[\e[0m\] $ '
    else
        PS1_EMOJI='\[\e[1;31m\]🐳🐳🐳\[\e[0m\] $ '
    fi
fi

PS1_PWD='\[\e[0;33m\]\w/\[\e[0m \]'
PS1_DATE='\[\e[2;33m\][$(date "+%Y/%m/%d %H:%M:%S")]\[\e[0m \]'

export PS1="$PS1_DATE$PS1_PWD$PS1_BRANCH$PS1_TASK\n $PS1_EMOJI"


