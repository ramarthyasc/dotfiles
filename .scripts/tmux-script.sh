#!/usr/bin/env bash

#### INSTALLATION

##########
### 0. You should have fzf & tmux installed previously.

### 1. Create ~/.scripts directory
### 2. Copy tmux-script.sh, fzf-script.sh to ~/.scripts directory
    ### 2.1 OPTIONAL (for nvim integration): Copy nvimfzf-script.sh also to ~/.scripts directory
    ### : Copy this script into your nvim keymaps
    # if vim.env.TMUX ~= nil and vim.env.TMUX ~= "" then
    #     vim.keymap.set("n", "<C-f>f", "<cmd>silent !tmux neww ~/.scripts/nvimfzf-script.sh 'w'<CR>")
    #     vim.keymap.set("n", "<C-f>s", "<cmd>silent !tmux neww ~/.scripts/nvimfzf-script.sh 's'<CR>")
    # end

### 3. Put these instructions in ~/.tmux.conf :
#set-option -g prefix 'C-@'
## High frequency directories
#bind-key h run-shell "bash ~/.scripts/tmux-script.sh 'h'"
#bind-key j run-shell "bash ~/.scripts/tmux-script.sh 'j'"
#bind-key k run-shell "bash ~/.scripts/tmux-script.sh 'k'"
#bind-key l run-shell "bash ~/.scripts/tmux-script.sh 'l'"

### 4. Put these instructions in ~/.bashrc (for bash users)
## Scripts
#source ~/.scripts/tmux-script.sh
#source ~/.scripts/fzf-script.sh

### 5. Specify the High frequency directories & custom session names for
### each directory
#### 5.1 Open tmux-script.sh & specify your high frequency directory locations.

    # #HIGH FREQUENCY DIRECTORIES : CHANGE THESE
    # If your high frequency directories are inside HOME directory : 
    # HIGH_FREQ_DIR0="$HOME/edit-path-to-high-freq-directory0"
    # HIGH_FREQ_DIR1="$HOME/edit-path-to-high-freq-directory1"
    # HIGH_FREQ_DIR2="$HOME/edit-path-to-high-freq-directory2"
    # HIGH_FREQ_DIR3="$HOME/edit-path-to-high-freq-directory3"
    #
    # HIGH_FREQ_DIR0_NAME="edit_here"
    # HIGH_FREQ_DIR1_NAME="edit_here"
    # HIGH_FREQ_DIR2_NAME="edit_here"
    # HIGH_FREQ_DIR3_NAME="edit_here"

### That's it ! Enjoy !!
##########

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

#bind is a readline command (only runs while in insert mode & we only need that property)

# THESE Bindings won't won't inside tmux because C-@ ie; C-space is attached as the 
# prefix of tmux. So tmux will only realize C-@ ie; C-space as it's prefix, and only execute
# it's binding after C-@ ie; C-space. So we need the same bindings in .tmux.conf too.
#
#If sourced from .bashrc - to use in terminal, do bind -x, otherwise when bind called
#from tmux, use tmux commands

#HIGH FREQUENCY DIRECTORIES : CHANGE THESE WHEN NEEDED
HIGH_FREQ_DIR0="$HOME/Web_Dev/leetcode_project/"
HIGH_FREQ_DIR1="$HOME/Web_Dev/open-source/n8n/"
HIGH_FREQ_DIR2="$HOME/Web_Dev/open-source/"
HIGH_FREQ_DIR3="$HOME/Programming/"

HIGH_FREQ_DIR0_NAME="draw-code"
HIGH_FREQ_DIR1_NAME="open1"
HIGH_FREQ_DIR2_NAME="open2"
HIGH_FREQ_DIR3_NAME="open3"


function hbind() {
    if [[ "$#" -gt 0 ]]; then
        tmux new-session -d -s "${HIGH_FREQ_DIR0_NAME}" -c "${HIGH_FREQ_DIR0}" 2>/dev/null
        tmux switch-client -t "${HIGH_FREQ_DIR0_NAME}"
    else
        tmux new-session -d -s "${HIGH_FREQ_DIR0_NAME}" -c ${HIGH_FREQ_DIR0} 2>/dev/null
        tmux attach-session -t "${HIGH_FREQ_DIR0_NAME}"
    fi
}
function jbind() {
    if [[ "$#" -gt 0 ]]; then
            tmux new-session -d -s "${HIGH_FREQ_DIR1_NAME}" -c "${HIGH_FREQ_DIR1}" 2>/dev/null
            tmux switch-client -t "${HIGH_FREQ_DIR1_NAME}"
    else
        tmux new-session -d -s "${HIGH_FREQ_DIR1_NAME}" -c "${HIGH_FREQ_DIR1}" 2>/dev/null
        tmux attach-session -t "${HIGH_FREQ_DIR1_NAME}"
    fi
}
function kbind() {
    if [[ "$#" -gt 0 ]]; then
            tmux new-session -d -s "${HIGH_FREQ_DIR2_NAME}" -c "${HIGH_FREQ_DIR2}" 2>/dev/null
            tmux switch-client -t "${HIGH_FREQ_DIR2_NAME}"
    else 
        tmux new-session -d -s "${HIGH_FREQ_DIR2_NAME}" -c "${HIGH_FREQ_DIR2}" 2>/dev/null
        tmux attach-session -t "${HIGH_FREQ_DIR2_NAME}"
    fi
}
function lbind() {
    if [[ "$#" -gt 0 ]]; then
            tmux new-session -d -s "${HIGH_FREQ_DIR3_NAME}" -c "${HIGH_FREQ_DIR3}" 2>/dev/null
            tmux switch-client -t "${HIGH_FREQ_DIR3_NAME}"
    else
        tmux new-session -s "${HIGH_FREQ_DIR3_NAME}" -c "${HIGH_FREQ_DIR3}" 2>/dev/null
        tmux attach-session -t "${HIGH_FREQ_DIR3_NAME}"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    # WHEN BASH SCRIPT IS EXECUTED (here, by the run-shell (child-process) of tmux.conf
    if [[ "$1" == "h" ]]; then
        hbind "exec"
    elif [[ "$1" == "j" ]]; then
        jbind "exec"
    elif [[ "$1" == "k" ]]; then
        kbind "exec"
    elif [[ "$1" == "l" ]]; then
        lbind "exec"
    fi
    ## $0 tells you which program executed the script. ie; if ./script.sh is executed, then
    ## ./script.sh is the program that runs the script inside. so $0 is ./script.sh. If script.sh is sourced,
    ## then, bash program in the terminal is running the script directly, so $0 is bash.
elif [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
    # WHEN BASH SCRIPT IS SOURCED (here, by .bashrc)
bind -x '"\C-@h": hbind'
bind -x '"\C-@j": jbind'
bind -x '"\C-@k": kbind'
bind -x '"\C-@l": lbind'

fi



# When you need to search for a distant directory, then use fzf in terminal or tmux
# and when selecting , give a tmux session for that directory

