#### USAGE

##########

#### TMUX - BASH LINKAGE

## C-space (ie; Prefix key - for both terminal & tmux) + h/j/k/l = 
## Open 'high frequency' directories in tmux in 
## new respective sessions. If a session is already present, then the client 'attaches' to that session 
## (if commanded from bash shell) or 'switches' to that session (if commanded from tmux shell).

#### FZF - TMUX - BASH LINKAGE

## If from bash terminal : 
## C-f = 
## Fzf opens, and the directory selected will be opened inside a new tmux session if not already created. If already created,
## then the client attaches to that session.
## If from Tmux session : 
## C-f + s = 
## Fzf shows up, and the directory selected will be opened inside a new tmux session if not already created. If already created,
## then the client attaches to that session.
## C-f + f = 
## Fzf shows up, and the selected directory will be opened inside a new window of the current session.

##########

export FZF_DEFAULT_OPTS='--no-height --no-reverse'

function bind_command() {
    selected_dir=$(find -L $HOME -type d -name '.*' -prune -o \
        -name 'node_modules' -prune -o \
        -type d -print | fzf)
    # This is run by bash. And bash shell ask tmux to do things (even when this
    # code is executed inside a tmux environment, there too, bash is running it.)
    if [[ -n $selected_dir ]]; then
        tmux new-session -d -s "${selected_dir##*/}" -c "${selected_dir}" 2>/dev/null
        tmux attach-session -t "${selected_dir##*/}"
    fi
}

function BIND_COMMAND_TMUX_S() {
    selected_dir=$(find -L $HOME -type d -name '.*' -prune -o \
        -name 'node_modules' -prune -o \
        -type d -print | fzf)

    ## If i want to create new-session, then i have to create a detached session (using -d flag),
    ## then attach the client to that session (using 'switch-client' command).
    if [[ -n $selected_dir ]]; then
        tmux new-session -d -s "${selected_dir##*/}" -c "${selected_dir}" 2>/dev/null
        tmux switch-client -t "${selected_dir##*/}"
    fi
    ## Note:  run-shell or anything else (Setting TMUX="" temporarily,etc..)  doesn't act like the
    ## instructions given in the .tmux.conf (which the tmux server internally executes).
    ## if the instruction to create new-session (using bind-key) is given inside .tmux.conf, then
    ## you can create a detached session and switch client to that session using that bind-key 
    ## without worrying about creating nested session.
    #
    }
function BIND_COMMAND_TMUX_W() {
    selected_dir=$(find -L $HOME -type d -name '.*' -prune -o \
        -name 'node_modules' -prune -o \
        -type d -print | fzf)
    if [[ -n $selected_dir ]]; then
        tmux new-window -n "${selected_dir##*/}" -c "${selected_dir}"
    fi

}

#Open that GENERIC directory in tmux
if [[ -n "$TMUX" ]]; then
    # new window
    bind -x '"\C-ff": BIND_COMMAND_TMUX_W'
    # new session
    bind -x '"\C-fs": BIND_COMMAND_TMUX_S'
else
    # new tmux session created from the Terminal
    bind -x '"\C-f": bind_command'
fi

## This function definition will be inherited by all the child processes 
## (Even the tmux server) which are initialized from the parent process 
## having these declared functions. 
export -f BIND_COMMAND_TMUX_S
export -f BIND_COMMAND_TMUX_W

