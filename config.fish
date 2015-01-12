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

set -x PATH $JAVA_HOME/bin $M2 $PATH $HOME/bin /opt/ros/fuerte/bin $JAVA_HOME/bin

set -x PYTHONPATH /opt/ros/fuerte/lib/python2.7/dist-packages $PYTHONPATH
set -x CMAKE_PREFIX_PATH /opt/ros/fuerte/share/catkin/cmake/Modules /opt/ros/fuerte $CMAKE_PREFIX_PATH
set -x LD_LIBRARY_PATH /opt/ros/fuerte/lib /other/libhid/src/.libs $LD_LIBRARY_PATH
set -x LD_LIBRARY_PATH /opt/ros/fuerte/lib
set -x PKG_CONFIG_PATH /opt/ros/fuerte/lib/pkgconfig $PKG_CONFIG_PATH
set -x ROS_HOME /other/logs/.ros
set -x ROS_WORKSPACE /other/workspace/vros
set -x ROS_ROOT /opt/ros/fuerte/share/ros
set -x ROSLISP_PACKAGE_DIRECTORY /opt/ros/fuerte/share/common-lisp/ros
set -x ROS_PACKAGE_PATH /opt/ros/fuerte/share /opt/ros/fuerte/stacks /other/workspace/vros

set -x ROS_PACKAGE_PATH /other/workspace/vros/original/waypoint_watcher:/other/workspace/vros/original/wifi_localization:/other/workspace/vros/third-party/gaussian_process:/other/workspace/vros/third-party/wifi_tools:/other/workspace/vros/original/testing/cylinder_detection:/other/workspace/vros/original/testing:/other/workspace/vros/experimental/third-party/face_rec:/other/workspace/vros/forked/depth_image_proc:/other/workspace/vros/forked/openni_camera:/other/workspace/vros/original/rqt_plugins/rqt_log_view:/other/workspace/vros/original/www/waypoint_wally:/other/workspace/vros/experimental/original/qna/ros_tld:/other/workspace/vros/experimental/original/qna/keyboard_control:/other/workspace/vros/experimental/original/qna/ardrone_control:/other/workspace/vros/experimental/third-party/ardrone_autonomy:/other/workspace/vros/experimental/third-party/open_tld:/other/workspace/vros/original/rqt_plugins/remote_msgs:/other/workspace/vros/original/rqt_plugins/rqt_vbag:/other/workspace/vros/original/rls_bagger:/other/workspace/vros/original/rqt_plugins/rqt_door:/other/workspace/vros/original/alloy_sim:/other/workspace/vros/original/rqt_plugins/rqt_logger:/other/workspace/vros/original/rqt_plugins/rqt_elevator:/other/workspace/vros/original/rqt_plugins/rqt_db_data:/other/workspace/vros/original/rqt_plugins/rqt_camera_display:/other/workspace/vros/original/rqt_plugins/rqt_joystick:/other/workspace/vros/forked/perception_pcl/pcl_ros:/other/workspace/vros/third-party/arm_kinematics_tools:/other/workspace/vros/forked/arm_navigation_experimental/interpolated_ik_motion_planner:/other/workspace/vros/original/perception_kit:/other/workspace/vros/original/jaco:/other/workspace/vros/experimental/original/depth_image_filters:/other/workspace/vros/original/rqt_plugins/rqt_qcbot_dashboard:/other/workspace/vros/forked/arm_navigation/joint_normalization_filters:/other/workspace/vros/forked/arm_navigation/arm_kinematics_constraint_aware:/other/workspace/vros/original/gradient_based_classification:/other/workspace/vros/original/rqt_plugins/rqt_system_status:/other/workspace/vros/original/rqt_plugins/rqt_ocu_log_parser:/other/workspace/vros/original/rqt_plugins/rqt_file_tail:/other/workspace/vros/experimental/original/kinova_manip:/other/workspace/vros/original/obstacle_analysis:/other/workspace/vros/forked/audio_common/audio_play:/other/workspace/vros/forked/audio_common/audio_capture:/other/workspace/vros/original/sls_squish_to_laserscan:/other/workspace/vros/third-party/fkie-ros-pkg:/other/workspace/vros/forked/gscam:/other/workspace/vros/experimental/forked/ccny_vision:/other/workspace/vros/forked/pmd_camboard_nano:/other/workspace/vros/forked/amcl:/other/workspace/vros/original/vgr/vperception_msgs:/other/workspace/vros/experimental/rharmony/pocketsphinx:/other/workspace/vros/third-party/bosch_web_visualization:/other/workspace/vros/original/person_track:/other/workspace/vros/original/vgr/mesh_tools:/other/workspace/vros/original/vgr/person_follow_gui:/other/workspace/vros/experimental/original/haws:/other/workspace/vros/forked/rosbridge_suite:/other/workspace/vros/original/vurdf/qcbot_urdf:/other/workspace/vros/forked/hokuyo_node:/other/workspace/vros/experimental/forked/KinovaROS/kinova_jaco:/other/workspace/vros/third-party/rosshell:/other/workspace/vros/third-party/point_cloud_converter:/other/workspace/vros/third-party/assisted_teleop:/other/workspace/vros/original/vgr/scene_model:/other/workspace/vros/original/vgr/hand_tracking:/other/workspace/vros/original/vgr/box_pose:/other/workspace/vros/original/human_analysis:/other/workspace/vros/original/qcbot/RosWS:/other/workspace/vros/original/costmap_manager:/other/workspace/vros/original/image_utils:/other/workspace/vros/original/vUtils:/other/workspace/vros/original/vurdf:/other/workspace/vros/original/pmdnano_camera:/other/workspace/vros/original/action_layer:/other/workspace/vros/original/action_proxy_msgs:/other/workspace/vros/original/action_proxy:/other/workspace/vros/original/manipulation:/other/workspace/vros/original/local_planner:/other/workspace/vros/original/vlaunch:/other/workspace/vros/original/topic_monitor:/other/workspace/vros/original/machine_info_msgs:/other/workspace/vros/original/datum_server:/other/workspace/vros/original/localization:/other/workspace/vros/original/nrv_ros_interface:/other/workspace/vros/original/environment_manager:/other/workspace/vros/original/bear_object_manipulation:/other/workspace/vros/original/bear_arm_navigation:/other/workspace/vros/original/waypoint_wrangler:/other/workspace/vros/original/auto_route_gen_msgs:/other/workspace/vros/original/mprim_msgs:/other/workspace/vros/original/location_recognition:/other/workspace/vros/original/location_msgs:/other/workspace/vros/original/image_search:/other/workspace/vros/forked/rosjava:/other/workspace/vros/forked/laser_pipeline/laser_filters:/other/workspace/vros/forked/openni_ros/depth_image_proc:/other/workspace/vros/forked/umd-ros-pkg/camera_umd/uvc_camera:/other/workspace/vros/forked/navigation/costmap_2d:/other/workspace/vros/forked/laser_pipeline/laser_geometry:/opt/ros/fuerte/stacks:/opt/ros/fuerte/share:/opt/ros/fuerte/share/ros

set -x ROS_MASTER_URI http://localhost:11311
set -x ROS_ETC_DIR /opt/ros/fuerte/etc/ros
set -x ROS_DISTRO fuerte

set -x PATH $M2 $PATH $HOME/bin /opt/ros/fuerte/bin $JAVA_HOME/bin

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
    find -name $argv[1] | xargs grep $argv[2]
end
