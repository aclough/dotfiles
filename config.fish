set -x EDITOR nvim

set PATH $PATH $HOME/.cargo/bin $HOME/.nimble/bin $HOME/.npm-global/bin $HOME/.local/bin

set -x HIP_VISIBLE_DEVICES 0

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

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
        set_color C7BF14 # Compliment of BD blue
    end
    printf '%s' (prompt_pwd)
    set_color normal
    if not contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
        printf ' (%s)' (parse_git_branch)
    end
    echo -n '> '
end

function fn
    find -name $argv[1] 2> /dev/null
end

function fng
    find -name $argv[1] -print0 2> /dev/null | xargs -0 grep $argv[2]
end

function p
    python3 $argv
end

function a
    rg -S --colors 'path:fg:yellow' $argv 2> /dev/null
end

function a-lit
    rg --fixed-strings --colors 'path:fg:yellow' $argv 2> /dev/null
end

function v
    nvim -p $argv
end

function vd
    nvim -d $argv
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

function zc
    zig build-exe --library c --c-source $argv
end

function alert
    play /usr/share/sounds/freedesktop/stereo/complete.oga
end

function gs
    git show $argv
end

function gb
    git checkout $argv^
end

function pyfmt
    black -l79 -S $argv
end

function ci
    eval /home/aclough/workspace/conda/bin/conda "shell.fish" "hook" $argv | source
end

function ca
    conda activate $argv
end

function cn
    conda create --name $argv
end

function o
    xdg-open $argv
end

function beep
    echo -en "\007"
end

