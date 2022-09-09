set -x EDITOR nvim

set -x PYTHONPATH /home/aclough/rhr/symlinks/ /home/aclough/workspace

wmname LG3D

set -x RIGHTPICK_PLATFORM v3

set PATH $PATH $HOME/.cargo/bin $HOME/.fzf/bin
set -x _JAVA_AWT_WM_NONREPARENTING 1

function parse_git_dirty
         git diff --quiet HEAD 2>&-
         if test $status = 1
            echo (set_color red)"Δ"(set_color normal)
         end
end
function parse_git_branch
         # git branch outputs lines, the current branch is prefixed with a *
         set -l branch (git branch --color 2>&- | awk '/\*/ {print $2}')
         echo $branch (parse_git_dirty)
end

function fish_prompt
    if test $status -ne 0
        set_color red
    else
        set_color FFB000 # RHR sunburst
    end
    printf '%s' (prompt_pwd)
    set_color normal
    if not contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
        printf ' (%s)' (parse_git_branch)
    end
    echo -n '> '
end

function fn
    find -name $argv
end

function fng
    find -name $argv[1] -print0 2> /dev/null | xargs -0 grep $argv[2]
end

function p
    python3 $argv
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

function rpp
    cd ~/rhr/pick
    docker-compose up -d
    docker-compose exec rightpick fish -c "set -x RIGHTPICK_PLATFORM v3; source ./rightpick/build/deploy/env.fish; fish"
end

function rs
    rsync -aurvhP $argv
end

# Ubuntu .bashrc compatibility
function ll
    ls -alFth $argv
end

function la
    ls -A $argv
end

function l
    ls -CF $argv
end

function alert
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
end

function s
    ssh -AM rhr@$argv -t fish
end

function gd
    git diff $argv{^,}
end
