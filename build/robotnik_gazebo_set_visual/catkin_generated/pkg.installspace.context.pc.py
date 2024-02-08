# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "message_runtime;gazebo_msgs;roscpp;rospy;nodelet;angles;std_srvs;geometry_msgs;sensor_msgs;nav_msgs;urdf;tf;tf2_ros;dynamic_reconfigure;rosgraph_msgs;trajectory_msgs;image_transport;rosconsole;camera_info_manager;std_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lrobotnik_gazebo_set_visual".split(';') if "-lrobotnik_gazebo_set_visual" != "" else []
PROJECT_NAME = "robotnik_gazebo_set_visual"
PROJECT_SPACE_DIR = "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/install"
PROJECT_VERSION = "0.0.1"
