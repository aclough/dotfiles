if type -p nvim
    set -x EDITOR nvim
else
    set -x EDITOR vim
end

set fish_git_dirty_color red

source ~/rhr/pick/build/deploy/env.fish > /dev/null

set PATH $PATH $HOME/.local/bin

function parse_git_dirty
         git diff --quiet HEAD ^&-
         if test $status = 1
            echo (set_color $fish_git_dirty_color)"Δ"(set_color normal)
         end
end
function parse_git_branch
         # git branch outputs lines, the current branch is prefixed with a *
         set -l branch (git branch --color ^&- | awk '/\*/ {print $2}')
         echo $branch (parse_git_dirty)
end

function fish_prompt
         if test -n "$SSH_CLIENT"
             set fish_color_cwd A62
         else
             set fish_color_cwd green
         end
         
         if contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
            printf '%s@%s %s%s%s $ '  (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
         else
            printf '%s@%s %s%s%s (%s) $ ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
         end
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
    ag --color-line-number '0;32' --color-match '0;31' --color-path '0;33' $argv
end

function v
    if type -p nvim
        nvim -p $argv
    else
        vim -p $argv
    end
end

function vd
    if type -p nvim
        nvim -d $argv
    else
        vimdiff  $argv
    end
end

function vdiff
    if type -p nvim
        nvim -d $argv
    else
        vimdiff $argv
    end
end

function rp
    cd ~/rhr/pick
end

function rs
    rsync -aurv $argv
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

function i
    ipython
end

function alert
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
end

function b
    bounce $argv -t fish
end
