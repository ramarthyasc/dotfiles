export FZF_DEFAULT_OPTS='--no-height --no-reverse'

function bind_command() {
    selected_dir=$(find -L $HOME -type d -name '.git' -prune -o \
        -name 'node_modules' -prune -o \
        -type d -print | fzf)
    # This is run by bash. And bash shell ask tmux to do things (even when this
    # code is executed inside a tmux environment, there too, bash is running it.)
    tmux new-session -s "${selected_dir##*/}" -c "${selected_dir}"
}

function bind_command_tmux() {
    selected_dir=$(find -L $HOME -type d -name '.git' -prune -o \
        -name 'node_modules' -prune -o \
        -type d -print | fzf)

    ## If i want to create new-session, then i have to create a detached session (using -d flag),
    ## then attach the client to that session (using 'switch-client' command).
    tmux new-window -n "${selected_dir##*/}" -c "${selected_dir}"
    }

#Open that directory inside tmux
if [[ -n "$TMUX" ]]; then
    # new window
    bind -x '"\C-f": bind_command_tmux'
else
    # new session
    bind -x '"\C-f": bind_command'
fi

