set -x GOPATH $HOME/go
set PATH $PATH $HOME/bin $HOME/go/bin /opt/ros/indigo/bin
set fish_git_dirty_color red

#set -x ROS_ROOT /opt/ros/indigo/share/ros
#set -x ROS_PACKAGE_PATH /opt/ros/indigo/share:/opt/ros/indigo/stacks
#set -x ROS_MASTER_URI http://localhost:11311
#set -x ROS_DISTRO indigo
#set -x ROS_ETC_DIR /opt/ros/indigo/etc/ros

bash /opt/ros/indigo/setup.sh
. ~/workspace/ros/tools/rosbash/rosfish

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
    mosh --server='athrun mosh_project mosh-server' aclough@apollo-dome-landing.mit.edu --  screen -R -x
end

function fn
    find -name $argv
end

function fng
    find -name $argv[1] | xargs grep $argv[2]
end
