set -x EDITOR nvim

set PATH $PATH $HOME/bin $HOME/.cargo/bin $HOME/.nimble/bin
set fish_git_dirty_color red


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
         if contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
            printf '%s%s%s > '    (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
         else
            printf '%s%s%s (%s) > '   (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
         end
end

function sscreen
    mosh --server='athrun mosh_project mosh-server' aclough@musical-notes.mit.edu --  screen -R -x -d
end

function sscreenx
    mosh --server='athrun mosh_project mosh-server' aclough@musical-notes.mit.edu --  screen -x
end

function mastyle
    astyle -s2 -a -S -H -U -c -n --lineend=linux $argv
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

# Ubuntu .bashrc compatibility
function ll
    ls -alFt
end

function la
    ls -A
end

function l
    ls -CF
end

function zc
    zig build-exe --library c --c-source $argv
end

function rs
    rsync -aurv $argv
end

function alert
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
end

function date_to_epoch
    date -d "$argv" +%s
end

function epoch_to_date
    date -ud @$argv
end
