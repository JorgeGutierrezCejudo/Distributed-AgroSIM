# CMake generated Testfile for 
# Source directory: /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz
# Build directory: /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_warthog_viz_roslaunch-check_launch_view_diagnostics.launch "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_diagnostics.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_diagnostics.launch.xml\" \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/launch/view_diagnostics.launch\" ")
set_tests_properties(_ctest_warthog_viz_roslaunch-check_launch_view_diagnostics.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;8;roslaunch_add_file_check;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;0;")
add_test(_ctest_warthog_viz_roslaunch-check_launch_view_model.launch "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_model.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_model.launch.xml\" \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/launch/view_model.launch\" ")
set_tests_properties(_ctest_warthog_viz_roslaunch-check_launch_view_model.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;9;roslaunch_add_file_check;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;0;")
add_test(_ctest_warthog_viz_roslaunch-check_launch_view_robot.launch "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_robot.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/build/warthog_viz/test_results/warthog_viz/roslaunch-check_launch_view_robot.launch.xml\" \"/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/launch/view_robot.launch\" ")
set_tests_properties(_ctest_warthog_viz_roslaunch-check_launch_view_robot.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;10;roslaunch_add_file_check;/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/warthog_desktop/warthog_viz/CMakeLists.txt;0;")
subdirs("gtest")
