# CMake generated Testfile for 
# Source directory: /home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/warthog_simulator/warthog_gazebo
# Build directory: /home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/build/warthog_gazebo
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_warthog_gazebo_roslaunch-check_launch_warthog_world.launch "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/build/warthog_gazebo/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/build/warthog_gazebo/test_results/warthog_gazebo/roslaunch-check_launch_warthog_world.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/build/warthog_gazebo/test_results/warthog_gazebo" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/build/warthog_gazebo/test_results/warthog_gazebo/roslaunch-check_launch_warthog_world.launch.xml\" \"/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/warthog_simulator/warthog_gazebo/launch/warthog_world.launch\" ")
set_tests_properties(_ctest_warthog_gazebo_roslaunch-check_launch_warthog_world.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/warthog_simulator/warthog_gazebo/CMakeLists.txt;40;roslaunch_add_file_check;/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/warthog_simulator/warthog_gazebo/CMakeLists.txt;0;")
subdirs("gtest")
