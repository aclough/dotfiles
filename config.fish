set -x EDITOR vim

set fish_git_dirty_color red

set -x _JAVA_AWT_WM_NONREPARENTING 1

source ~/rhr/pick/build/deploy/env.fish > /dev/null

set PATH $PATH $HOME/.local/bin
set -x GOPATH /home/aclough/workspace/go

#set -x _ASSET_TEST_KNOWLEDGE /home/aclough/outside_knowledge
#set -x _RHR_KNOWLEDGE_SELF_NAME rhr-rp-004

set -x LCM_JAR $RIGHTPICK/build/depoy/share/java/lcmtypes_RightPick.jar
set -x CLASSPATH $CLASSPATH $LCM_JAR

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
         if contains "no git" (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
            printf '%s@%s %s%s%s $ '  (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
         else
            printf '%s@%s %s%s%s (%s) $ ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
         end
end

function sscreen
    mosh --server='athrun mosh_project mosh-server' aclough@mass-toolpike.mit.edu --  screen -R -x -d
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
    ag --color-line-number '0;32' --color-match '0;31' --color-path '0;33' $argv
end

function v
    if type -p nvim
        nvim $argv
    else
        vim $argv
    end
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

