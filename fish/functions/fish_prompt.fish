function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color blue
    printf '%s' (prompt_pwd)
    set_color magenta
    printf '%s' (fish_git_prompt)
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    set_color green
    printf ' $ '
end
