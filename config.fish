set -x EDITOR vim

set PATH $PATH $HOME/bin
set fish_git_dirty_color red

set -x _JAVA_AWT_WM_NONREPARENTING 1

set -x CMAKE_PREFIX_PATH $ROSPATH
set -x CPATH $ROSPATH/include
set -x LD_LIBRARY_PATH $ROSPATH/lib:$ROSPATH/lib/x86_64-linux-gnu
set PATH $PATH $ROSPATH/bin
set -x PKG_CONFIG $ROSPATH/lib/pkgconfig:$ROSPATH/lib/x86_64-linux-gnu/pkgconfig
set -x PYTHONPATH $ROSPATH/lib/python2.7/dist-packages

set -x RIGHTPICK $HOME/rhr/pick
set -x PATH $PATH $RIGHTPICK/build/deploy/bin $RIGHTPICK/build/externals/bin
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $RIGHTPICK/build/externals/lib $RIGHTPICK/build/deploy/lib
set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH $RIGHTPICK/build/externals/lib/pkgconfig
set -x PYTHONPATH $PYTHONPATH $RIGHTPICK/build/deploy/lib/python2.7/dist-packages
set -x PYTHONPATH $PYTHONPATH $RIGHTPICK/build/deploy/lib/python2.7/site-packages
set -x PYTHONPATH $PYTHONPATH $RIGHTPICK/build/externals/lib/python2.7/dist-packages
set -x PYTHONPATH $PYTHONPATH $RIGHTPICK/build/externals/lib/python2.7/site-packages
set -x LCM_JAR $RIGHTPICK/build/depoy/share/java/lcmtypes_RightPick.jar
set -x CLASSPATH $CLASSPATH $LCM_JAR

. ~/dotfiles/rosfish

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
    mosh --server='athrun mosh_project mosh-server' aclough@apollo-dome-landing.mit.edu --  screen -R -x -d
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
    vim -p $argv
end

# Ubuntu .bashrc compatibility
function ll
    ls -alF
end

function la
    ls -A
end

function l
    ls -CF
end
