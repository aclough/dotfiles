set -x EDITOR nvim

set fish_git_dirty_color red

source ~/rhr/pick/build/deploy/env.fish > /dev/null

set PATH $PATH $HOME/.local/bin $HOME/.cargo/bin
set -x _JAVA_AWT_WM_NONREPARENTING 1

function parse_git_dirty
         git diff --quiet HEAD 2>&-
         if test $status = 1
            echo (set_color $fish_git_dirty_color)"Δ"(set_color normal)
         end
end
function parse_git_branch
         # git branch outputs lines, the current branch is prefixed with a *
         set -l branch (git branch --color 2>&- | awk '/\*/ {print $2}')
         echo $branch (parse_git_dirty)
end

function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end
    if test $status -ne 0
        set_color red
    else
        set_color FB8B00 # Ubuntu orange
    end
    printf '%s' (prompt_pwd)
    set_color normal
    if not contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
        printf ' (%s)' (parse_git_branch)
    end
    echo -n '> '
end

function sscreen
    mosh --server='athrun mosh_project mosh-server' aclough@musical-notes.mit.edu --  screen -R -x -d
end

function fn
    find -name $argv
end

function fng
    find -name $argv[1] -print0 2> /dev/null | xargs -0 grep $argv[2]
end

function a
    rg -S --colors 'path:fg:yellow' $argv
end

function v
    nvim -p $argv
end

function vd
    nvim -d $argv
end

function rp
    cd ~/rhr/pick
end

function rs
    rsync -aurv $argv
end

# Ubuntu .bashrc compatibility
function ll
    ls -alFth
end

function la
    ls -A
end

function l
    ls -CF
end

function i
    ipython
end

function alert
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
end

function b
    bounce $argv -t fish
end

function date_to_epoch
    date -d "$argv" +%s
end

function epoch_to_date
    date -ud @$argv
end

function s
    ssh rhr@$argv -t fish
end
