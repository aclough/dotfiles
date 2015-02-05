set -x EDITOR vim

set PATH $PATH $HOME/bin
set -x JAVA_HOME /other/java
set -x JDK_HOME $JAVA_HOME
set -x JAVAWS jre/javaws
set -x JAVAWS_HOME $JAVA_HOME/$JAVAWS
set -x JAVA_OPTS "-server -Xmx1024m -Xms512m -XX:MaxPermSize=512m"

set -x M2_HOME /opt/maven
set -x M2 /opt/maven/bin
set -x MAVEN_HOME /opt/maven
set -x MAVENREPO_PATH /other/maven/mavenRepository

set -x GIT_CEILING_DIRECTORIES "/net/home3:/net/home4:/net/home:/net/home2:/net"

# For kiosk
set -x CATALINA_HOME /other/tomcat
set -x CATALINA_PID /other/tomcat/pid
set -x TOMCAT_HOME /other/tomcat

set -x PERCEPTION_KIT_PATH /other/workspace/perception/perception_kit
set -x NEXUS_PATH /other/workspace/nexus
set -x KIOSK_PATH /other/workspace/kiosk-platform
set -x USERADMIN_PATH /other/workspace/useradminWebapp
set -x VCAS_PATH /other/workspace/vCas
set -x RLS_PATH /other/workspace/rls
set -x NRV_QCBOT_PATH /other/workspace/nrv-clean/qcbot/
set -x NRV_6DOF_PATH /other/workspace/nrv-clean/6dof
set -x NRV_RPR_PATH /other/workspace/nrv-clean/rpr
set -x NRV_CORE_PATH /other/workspace/nrv-clean/core/

set -x VROS_PATH /other/workspace/vros
set -x ROS_WORKSPACE $VROS_PATH
set -x ROS_DISTRO indigo
set -x ROS_HOME /other/logs/ros
set ROSPATH /opt/ros/$ROS_DISTRO
set -x ROS_ROOT $ROSPATH/share/ros

set -x ROS_PACKAGE_PATH /other/workspace/vros/src:$ROSPATH/share:$ROSPATH/stacks
set -x ROS_SHARE_PATH $VROS_PATH/devel/share:$ROS_PACKAGE_PATH
set -x CMAKE_PREFIX_PATH $VROS_PATH/devel:$ROSPATH
set -x LD_LIBRARY_PATH VROS_PATH/devel/lib:$VROS_PATH/devel/lib/x86_64-linux-gnu:$ROSPATH/lib:$ROSPATH/lib/x86_64-linux-gnu:/other/libhid/src/.libs
set -x INCLUDE_PATH /usr/include/eigen3:$ROSPATH/include:$ROSPATH/include/opencv
set -x CPLUS_INCLUDE_PATH $INCLUDE_PATH
set -x CPATH $INCLUDE_PATH:$VROS_PATH/devel/include
set -x PYTHONPATH $VROS_PATH/devel/lib/python2.7/dist-packages:$ROSPATH/lib/python2.7/dist-packages
set -x ROSLISP_PACKAGE_DIRECTORIES $ROSPATH/share/common-lisp/ros:$VROS_PATH/devel/share/common-lisp
set -x ROS_ETC_DIR /opt/ros/indigo/etc/ros
set -x ROS_MASTER_URI http://localhost:11311
set -x ROS_MAVEN_DEPLOYMENT_REPOSITORY $MAVENREPO_PATH
set -x ROS_MAVEN_PATH $ROS_MAVEN_DEPLOYMENT_REPOSITORY:$ROS_MAVEN_PATH

set -x PATH $NRV_QCBOT_PATH/scripts $HOME/bin /opt/ros/indigo/bin $JAVA_HOME/bin $M2 $PATH

. ~/dotfiles/rosfish

set fish_git_dirty_color red

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

function mastyle
    astyle -s2 -a -S -H -U -c -n --lineend=linux $argv
end

function fn
    find -name $argv
end

function fng
    find -name $argv[1] -print0 2> /dev/null | xargs -0 grep $argv[2]
end
