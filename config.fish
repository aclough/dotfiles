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

set -x PATH $JAVA_HOME/bin $M2 $PATH $HOME/bin /opt/ros/indigo/bin $JAVA_HOME/bin

set -x ROSPATH /opt/ros/indigo
set -x CMAKE_PREFIX_PATH $ROSPATH
set -x LD_LIBRARY_PATH $ROSPATH/lib:$ROSPATH/lib/x86_64-linux-gnu:/other/libhid/src/.libs
set -x PKG_CONFIG $ROSPATH/lib/pkgconfig:$ROSPATH/pkgconfig/x86_64-linux-gnu/pkgconfig
set -x PYTHONPATH $ROSPATH/lib/python2.7/dist-packages
set -x ROS_DISTRO indigo
set -x ROS_PACKAGE_PATH  actionlib:/opt/ros/indigo/share/actionlib:actionlib_msgs:/opt/ros/indigo/share/actionlib_msgs:actionlib_tutorials:/opt/ros/indigo/share/actionlib_tutorials:angles:/opt/ros/indigo/share/angles:arbotix_controllers:/opt/ros/indigo/share/arbotix_controllers:arbotix_msgs:/opt/ros/indigo/share/arbotix_msgs:arbotix_python:/opt/ros/indigo/share/arbotix_python:audio_capture:/opt/ros/indigo/share/audio_capture:audio_common_msgs:/opt/ros/indigo/share/audio_common_msgs:audio_play:/other/workspace/vros/src/forked/audio_common/audio_play:auto_route_gen_msgs:/other/workspace/vros/src/original/auto_route_gen_msgs:bond:/opt/ros/indigo/share/bond:bondcpp:/opt/ros/indigo/share/bondcpp:bondpy:/opt/ros/indigo/share/bondpy:camera_calibration:/opt/ros/indigo/share/camera_calibration:camera_calibration_parsers:/opt/ros/indigo/share/camera_calibration_parsers:camera_info_manager:/opt/ros/indigo/share/camera_info_manager:catkin:/opt/ros/indigo/share/catkin:class_loader:/opt/ros/indigo/share/class_loader:cmake_modules:/opt/ros/indigo/share/cmake_modules:collada_parser:/opt/ros/indigo/share/collada_parser:collada_urdf:/opt/ros/indigo/share/collada_urdf:compressed_depth_image_transport:/opt/ros/indigo/share/compressed_depth_image_transport:compressed_image_transport:/opt/ros/indigo/share/compressed_image_transport:control_msgs:/opt/ros/indigo/share/control_msgs:cpp_common:/opt/ros/indigo/share/cpp_common:cv_bridge:/opt/ros/indigo/share/cv_bridge:datum_server:/other/workspace/vros/src/original/datum_server:depth_image_proc:/opt/ros/indigo/share/depth_image_proc:diagnostic_aggregator:/opt/ros/indigo/share/diagnostic_aggregator:diagnostic_analysis:/opt/ros/indigo/share/diagnostic_analysis:diagnostic_common_diagnostics:/opt/ros/indigo/share/diagnostic_common_diagnostics:diagnostic_msgs:/opt/ros/indigo/share/diagnostic_msgs:diagnostic_updater:/opt/ros/indigo/share/diagnostic_updater:driver_base:/opt/ros/indigo/share/driver_base:dynamic_reconfigure:/opt/ros/indigo/share/dynamic_reconfigure:eigen_conversions:/opt/ros/indigo/share/eigen_conversions:eigen_stl_containers:/opt/ros/indigo/share/eigen_stl_containers:fcl:/opt/ros/indigo/share/fcl:filters:/opt/ros/indigo/share/filters:floor_determination:/other/workspace/vros/src/original/floor_determination:foo:/other/workspace/vros/src/original/foo:gaussian_process:/other/workspace/vros/src/third_party/gaussian_process:gazebo_msgs:/opt/ros/indigo/share/gazebo_msgs:gazebo_plugins:/opt/ros/indigo/share/gazebo_plugins:gazebo_ros:/opt/ros/indigo/share/gazebo_ros:gencpp:/opt/ros/indigo/share/gencpp:genlisp:/opt/ros/indigo/share/genlisp:genmsg:/opt/ros/indigo/share/genmsg:genpy:/opt/ros/indigo/share/genpy:geometric_shapes:/opt/ros/indigo/share/geometric_shapes:geometry_msgs:/opt/ros/indigo/share/geometry_msgs:household_objects_database_msgs:/opt/ros/indigo/share/household_objects_database_msgs:image_geometry:/opt/ros/indigo/share/image_geometry:image_proc:/opt/ros/indigo/share/image_proc:image_rotate:/opt/ros/indigo/share/image_rotate:image_transport:/opt/ros/indigo/share/image_transport:image_view:/opt/ros/indigo/share/image_view:interactive_marker_tutorials:/opt/ros/indigo/share/interactive_marker_tutorials:interactive_markers:/opt/ros/indigo/share/interactive_markers:joint_state_publisher:/opt/ros/indigo/share/joint_state_publisher:kdl_conversions:/opt/ros/indigo/share/kdl_conversions:kdl_parser:/opt/ros/indigo/share/kdl_parser:laser_assembler:/opt/ros/indigo/share/laser_assembler:laser_filters:/opt/ros/indigo/share/laser_filters:laser_geometry:/other/workspace/vros/src/forked/laser_geometry:laser_proc:/opt/ros/indigo/share/laser_proc:libccd:/opt/ros/indigo/share/libccd:librviz_tutorial:/opt/ros/indigo/share/librviz_tutorial:location_msgs:/other/workspace/vros/src/original/location_msgs:machine_info_msgs:/other/workspace/vros/src/original/machine_info_msgs:manipulation_msgs:/opt/ros/indigo/share/manipulation_msgs:map_msgs:/opt/ros/indigo/share/map_msgs:media_export:/opt/ros/indigo/share/media_export:message_filters:/opt/ros/indigo/share/message_filters:message_generation:/opt/ros/indigo/share/message_generation:message_runtime:/opt/ros/indigo/share/message_runtime:mjpeg_server:/opt/ros/indigo/share/mjpeg_server:mk:/opt/ros/indigo/share/mk:moveit_commander:/opt/ros/indigo/share/moveit_commander:moveit_core:/opt/ros/indigo/share/moveit_core:moveit_msgs:/opt/ros/indigo/share/moveit_msgs:moveit_planners_ompl:/opt/ros/indigo/share/moveit_planners_ompl:moveit_ros_manipulation:/opt/ros/indigo/share/moveit_ros_manipulation:moveit_ros_move_group:/opt/ros/indigo/share/moveit_ros_move_group:moveit_ros_perception:/opt/ros/indigo/share/moveit_ros_perception:moveit_ros_planning:/opt/ros/indigo/share/moveit_ros_planning:moveit_ros_planning_interface:/opt/ros/indigo/share/moveit_ros_planning_interface:moveit_ros_robot_interaction:/opt/ros/indigo/share/moveit_ros_robot_interaction:moveit_ros_visualization:/opt/ros/indigo/share/moveit_ros_visualization:moveit_ros_warehouse:/opt/ros/indigo/share/moveit_ros_warehouse:moveit_simple_controller_manager:/opt/ros/indigo/share/moveit_simple_controller_manager:mprim_msgs:/other/workspace/vros/src/original/mprim_msgs:nav_msgs:/opt/ros/indigo/share/nav_msgs:nodelet:/opt/ros/indigo/share/nodelet:nodelet_topic_tools:/opt/ros/indigo/share/nodelet_topic_tools:nodelet_tutorial_math:/opt/ros/indigo/share/nodelet_tutorial_math:object_recognition_msgs:/opt/ros/indigo/share/object_recognition_msgs:octomap:/opt/ros/indigo/share/octomap:octomap_msgs:/opt/ros/indigo/share/octomap_msgs:ompl:/opt/ros/indigo/share/ompl:openni_camera:/opt/ros/indigo/share/openni_camera:openni_launch:/opt/ros/indigo/share/openni_launch:orocos_kdl:/opt/ros/indigo/share/orocos_kdl:pcl_conversions:/opt/ros/indigo/share/pcl_conversions:pcl_msgs:/opt/ros/indigo/share/pcl_msgs:pcl_ros:/other/workspace/vros/src/forked/pcl_ros/pcl_ros:pluginlib:/opt/ros/indigo/share/pluginlib:pluginlib_tutorials:/opt/ros/indigo/share/pluginlib_tutorials:pointcloud_to_laserscan:/other/workspace/vros/src/forked/pcl_ros/pointcloud_to_laserscan:polled_camera:/opt/ros/indigo/share/polled_camera:python_orocos_kdl:/opt/ros/indigo/share/python_orocos_kdl:python_qt_binding:/opt/ros/indigo/share/python_qt_binding:qt_dotgraph:/opt/ros/indigo/share/qt_dotgraph:qt_gui:/opt/ros/indigo/share/qt_gui:qt_gui_cpp:/opt/ros/indigo/share/qt_gui_cpp:qt_gui_py_common:/opt/ros/indigo/share/qt_gui_py_common:random_numbers:/opt/ros/indigo/share/random_numbers:remote_msgs:/other/workspace/vros/src/original/remote_msgs:resource_retriever:/opt/ros/indigo/share/resource_retriever:rgbd_launch:/opt/ros/indigo/share/rgbd_launch:robot_state_publisher:/opt/ros/indigo/share/robot_state_publisher:rosbag:/opt/ros/indigo/share/rosbag:rosbag_migration_rule:/opt/ros/indigo/share/rosbag_migration_rule:rosbag_storage:/opt/ros/indigo/share/rosbag_storage:rosbash:/opt/ros/indigo/share/rosbash:rosboost_cfg:/opt/ros/indigo/share/rosboost_cfg:rosbuild:/opt/ros/indigo/share/rosbuild:rosclean:/opt/ros/indigo/share/rosclean:rosconsole:/opt/ros/indigo/share/rosconsole:rosconsole_bridge:/opt/ros/indigo/share/rosconsole_bridge:roscpp:/opt/ros/indigo/share/roscpp:roscpp_serialization:/opt/ros/indigo/share/roscpp_serialization:roscpp_traits:/opt/ros/indigo/share/roscpp_traits:roscpp_tutorials:/opt/ros/indigo/share/roscpp_tutorials:roscreate:/opt/ros/indigo/share/roscreate:rosgraph:/opt/ros/indigo/share/rosgraph:rosgraph_msgs:/opt/ros/indigo/share/rosgraph_msgs:roslang:/opt/ros/indigo/share/roslang:roslaunch:/opt/ros/indigo/share/roslaunch:roslib:/opt/ros/indigo/share/roslib:roslint:/opt/ros/indigo/share/roslint:roslisp:/opt/ros/indigo/share/roslisp:roslz4:/opt/ros/indigo/share/roslz4:rosmake:/opt/ros/indigo/share/rosmake:rosmaster:/opt/ros/indigo/share/rosmaster:rosmsg:/opt/ros/indigo/share/rosmsg:rosnode:/opt/ros/indigo/share/rosnode:rosout:/opt/ros/indigo/share/rosout:rospack:/opt/ros/indigo/share/rospack:rosparam:/opt/ros/indigo/share/rosparam:rospy:/opt/ros/indigo/share/rospy:rospy_tutorials:/opt/ros/indigo/share/rospy_tutorials:rosservice:/opt/ros/indigo/share/rosservice:rosshell:/other/workspace/vros/src/third_party/rosshell:rostest:/opt/ros/indigo/share/rostest:rostime:/opt/ros/indigo/share/rostime:rostopic:/opt/ros/indigo/share/rostopic:rosunit:/opt/ros/indigo/share/rosunit:roswtf:/opt/ros/indigo/share/roswtf:rqt_action:/opt/ros/indigo/share/rqt_action:rqt_bag:/opt/ros/indigo/share/rqt_bag:rqt_bag_plugins:/opt/ros/indigo/share/rqt_bag_plugins:rqt_console:/opt/ros/indigo/share/rqt_console:rqt_dep:/opt/ros/indigo/share/rqt_dep:rqt_graph:/opt/ros/indigo/share/rqt_graph:rqt_gui:/opt/ros/indigo/share/rqt_gui:rqt_gui_cpp:/opt/ros/indigo/share/rqt_gui_cpp:rqt_gui_py:/opt/ros/indigo/share/rqt_gui_py:rqt_image_view:/opt/ros/indigo/share/rqt_image_view:rqt_launch:/opt/ros/indigo/share/rqt_launch:rqt_logger_level:/opt/ros/indigo/share/rqt_logger_level:rqt_moveit:/opt/ros/indigo/share/rqt_moveit:rqt_msg:/opt/ros/indigo/share/rqt_msg:rqt_nav_view:/opt/ros/indigo/share/rqt_nav_view:rqt_plot:/opt/ros/indigo/share/rqt_plot:rqt_pose_view:/opt/ros/indigo/share/rqt_pose_view:rqt_publisher:/opt/ros/indigo/share/rqt_publisher:rqt_py_common:/opt/ros/indigo/share/rqt_py_common:rqt_py_console:/opt/ros/indigo/share/rqt_py_console:rqt_reconfigure:/opt/ros/indigo/share/rqt_reconfigure:rqt_robot_dashboard:/opt/ros/indigo/share/rqt_robot_dashboard:rqt_robot_monitor:/opt/ros/indigo/share/rqt_robot_monitor:rqt_robot_steering:/opt/ros/indigo/share/rqt_robot_steering:rqt_runtime_monitor:/opt/ros/indigo/share/rqt_runtime_monitor:rqt_rviz:/opt/ros/indigo/share/rqt_rviz:rqt_service_caller:/opt/ros/indigo/share/rqt_service_caller:rqt_shell:/opt/ros/indigo/share/rqt_shell:rqt_srv:/opt/ros/indigo/share/rqt_srv:rqt_tf_tree:/opt/ros/indigo/share/rqt_tf_tree:rqt_top:/opt/ros/indigo/share/rqt_top:rqt_topic:/opt/ros/indigo/share/rqt_topic:rqt_web:/opt/ros/indigo/share/rqt_web:rviz:/opt/ros/indigo/share/rviz:rviz_plugin_tutorials:/opt/ros/indigo/share/rviz_plugin_tutorials:rviz_python_tutorial:/opt/ros/indigo/share/rviz_python_tutorial:self_test:/opt/ros/indigo/share/self_test:sensor_msgs:/opt/ros/indigo/share/sensor_msgs:shape_msgs:/opt/ros/indigo/share/shape_msgs:shape_tools:/opt/ros/indigo/share/shape_tools:smach:/opt/ros/indigo/share/smach:smach_msgs:/opt/ros/indigo/share/smach_msgs:smach_ros:/opt/ros/indigo/share/smach_ros:smclib:/opt/ros/indigo/share/smclib:sound_play:/opt/ros/indigo/share/sound_play:srdfdom:/opt/ros/indigo/share/srdfdom:stage:/opt/ros/indigo/share/stage:stage_ros:/opt/ros/indigo/share/stage_ros:std_msgs:/opt/ros/indigo/share/std_msgs:std_srvs:/opt/ros/indigo/share/std_srvs:stereo_image_proc:/opt/ros/indigo/share/stereo_image_proc:stereo_msgs:/opt/ros/indigo/share/stereo_msgs:tf:/opt/ros/indigo/share/tf:tf2:/opt/ros/indigo/share/tf2:tf2_geometry_msgs:/opt/ros/indigo/share/tf2_geometry_msgs:tf2_msgs:/opt/ros/indigo/share/tf2_msgs:tf2_py:/opt/ros/indigo/share/tf2_py:tf2_ros:/opt/ros/indigo/share/tf2_ros:tf_conversions:/opt/ros/indigo/share/tf_conversions:theora_image_transport:/opt/ros/indigo/share/theora_image_transport:topic_tools:/opt/ros/indigo/share/topic_tools:trajectory_msgs:/opt/ros/indigo/share/trajectory_msgs:turtle_actionlib:/opt/ros/indigo/share/turtle_actionlib:turtle_tf:/opt/ros/indigo/share/turtle_tf:turtle_tf2:/opt/ros/indigo/share/turtle_tf2:turtlebot_arm_block_manipulation:/opt/ros/indigo/share/turtlebot_arm_block_manipulation:turtlebot_arm_bringup:/opt/ros/indigo/share/turtlebot_arm_bringup:turtlebot_arm_description:/opt/ros/indigo/share/turtlebot_arm_description:turtlebot_arm_ikfast_plugin:/opt/ros/indigo/share/turtlebot_arm_ikfast_plugin:turtlebot_arm_kinect_calibration:/opt/ros/indigo/share/turtlebot_arm_kinect_calibration:turtlebot_arm_moveit_config:/opt/ros/indigo/share/turtlebot_arm_moveit_config:turtlebot_arm_moveit_demos:/opt/ros/indigo/share/turtlebot_arm_moveit_demos:turtlesim:/opt/ros/indigo/share/turtlesim:urdf:/opt/ros/indigo/share/urdf:urdf_parser_plugin:/opt/ros/indigo/share/urdf_parser_plugin:urdf_tutorial:/opt/ros/indigo/share/urdf_tutorial:urg_c:/opt/ros/indigo/share/urg_c:urg_node:/opt/ros/indigo/share/urg_node:visualization_marker_tutorials:/opt/ros/indigo/share/visualization_marker_tutorials:visualization_msgs:/opt/ros/indigo/share/visualization_msgs:vperception_msgs:/other/workspace/vros/src/original/vperception_msgs:warehouse_ros:/opt/ros/indigo/share/warehouse_ros:wifi_localization:/other/workspace/vros/src/original/wifi_localization:wifi_tools:/other/workspace/vros/src/forked/wifi_tools:xacro:/opt/ros/indigo/share/xacro:xmlrpcpp:/opt/ros/indigo/share/xmlrpcpp

set -x ROS_HOME /other/logs/.ros
set -x ROS_WORKSPACE /other/workspace/vros
set -x ROSLISP_PACKAGE_DIRECTORY $ROSPATH/share/common-lisp/ros


set -x ROS_MASTER_URI http://localhost:11311
set -x ROS_ETC_DIR /opt/ros/indigo/etc/ros

set -x PATH $M2 $PATH $HOME/bin /opt/ros/indigo/bin $JAVA_HOME/bin

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
