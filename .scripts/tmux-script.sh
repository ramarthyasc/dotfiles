bind -m  vi-command '"\C-ah": "tmux new-session -s draw-code -c ~/Web_Dev/leetcode_project/ \n"'
bind -m  vi-insert '"\C-ah": "tmux new-session -s draw-code -c ~/Web_Dev/leetcode_project/ \n"'

bind -m  vi-command '"\C-aj": "tmux new-session -s open1 -c  ~/Web_Dev/open-source/n8n/ \n"'
bind -m  vi-insert '"\C-aj": "tmux new-session -s open1 -c ~/Web_Dev/open-source/n8n/ \n"'

bind -m  vi-command '"\C-ak": "tmux new-session -s open2 -c ~/Web_Dev/open-source/ \n"'
bind -m  vi-insert '"\C-ak": "tmux new-session -s open2 -c ~/Web_Dev/open-source/ \n"'

bind -m  vi-command '"\C-al": "tmux new-session -s open3 -c ~/Programming/ \n"'
bind -m  vi-insert '"\C-al": "tmux new-session -s open3 -c ~/Programming/ \n"'


# When you need to search for a distant directory, then use fzf in terminal or tmux
# and when selecting , give a tmux session for that directory

