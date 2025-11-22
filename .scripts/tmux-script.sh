#bind is a readline command (only runs while in insert mode & we only need that property)
bind -x '"\C-ah": tmux new-session -s draw-code -c ~/Web_Dev/leetcode_project/'

bind -x '"\C-aj": tmux new-session -s open1 -c ~/Web_Dev/open-source/n8n/'

bind -x '"\C-ak": tmux new-session -s open2 -c ~/Web_Dev/open-source/'

bind -x '"\C-al": tmux new-session -s open3 -c ~/Programming/'


# When you need to search for a distant directory, then use fzf in terminal or tmux
# and when selecting , give a tmux session for that directory

