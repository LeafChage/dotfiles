if type peco 1>/dev/null 2>/dev/null; then
    peco_history() {
        # history format init
        savedHistory=$HISTTIMEFORMAT
        HISTTIMEFORMAT=""

        local tac
        if type gtac 1>/dev/null 2>/dev/null; then
            tac="gtac"
        elif type tac 1>/dev/null 2>/dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi

        READLINE_LINE=$(HISTTIMEFORMAT= history | $tac | awk '{for(i=2;i<NF;++i){printf("%s ",$i)}print $NF}' | peco --query "$READLINE_LINE")
        READLINE_POINT=${#READLINE_LINE}

        # set history format
        HISTTIMEFORMAT=$savedHistory
    }
    bind -x '"\C-r": peco_history'
fi
