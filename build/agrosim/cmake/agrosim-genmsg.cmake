# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "agrosim: 4 messages, 2 services")

set(MSG_I_FLAGS "-Iagrosim:/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iagrosim:/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(agrosim_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" ""
)

get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" ""
)

get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" "agrosim/neighbour"
)

get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" ""
)

get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" ""
)

get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_custom_target(_agrosim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agrosim" "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)
_generate_msg_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)
_generate_msg_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg"
  "${MSG_I_FLAGS}"
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)
_generate_msg_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)

### Generating Services
_generate_srv_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)
_generate_srv_cpp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
)

### Generating Module File
_generate_module_cpp(agrosim
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(agrosim_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(agrosim_generate_messages agrosim_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_cpp _agrosim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agrosim_gencpp)
add_dependencies(agrosim_gencpp agrosim_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agrosim_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)
_generate_msg_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)
_generate_msg_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg"
  "${MSG_I_FLAGS}"
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)
_generate_msg_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)

### Generating Services
_generate_srv_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)
_generate_srv_eus(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
)

### Generating Module File
_generate_module_eus(agrosim
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(agrosim_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(agrosim_generate_messages agrosim_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_eus _agrosim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agrosim_geneus)
add_dependencies(agrosim_geneus agrosim_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agrosim_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)
_generate_msg_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)
_generate_msg_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg"
  "${MSG_I_FLAGS}"
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)
_generate_msg_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)

### Generating Services
_generate_srv_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)
_generate_srv_lisp(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
)

### Generating Module File
_generate_module_lisp(agrosim
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(agrosim_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(agrosim_generate_messages agrosim_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_lisp _agrosim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agrosim_genlisp)
add_dependencies(agrosim_genlisp agrosim_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agrosim_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)
_generate_msg_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)
_generate_msg_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg"
  "${MSG_I_FLAGS}"
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)
_generate_msg_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)

### Generating Services
_generate_srv_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)
_generate_srv_nodejs(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
)

### Generating Module File
_generate_module_nodejs(agrosim
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(agrosim_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(agrosim_generate_messages agrosim_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_nodejs _agrosim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agrosim_gennodejs)
add_dependencies(agrosim_gennodejs agrosim_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agrosim_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)
_generate_msg_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)
_generate_msg_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg"
  "${MSG_I_FLAGS}"
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)
_generate_msg_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)

### Generating Services
_generate_srv_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)
_generate_srv_py(agrosim
  "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
)

### Generating Module File
_generate_module_py(agrosim
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(agrosim_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(agrosim_generate_messages agrosim_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/neighbour.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/centralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/descentralised.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/msg/distributed.msg" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Cost.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/srv/Decision.srv" NAME_WE)
add_dependencies(agrosim_generate_messages_py _agrosim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agrosim_genpy)
add_dependencies(agrosim_genpy agrosim_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agrosim_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agrosim
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(agrosim_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET agrosim_generate_messages_cpp)
  add_dependencies(agrosim_generate_messages_cpp agrosim_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agrosim
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(agrosim_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET agrosim_generate_messages_eus)
  add_dependencies(agrosim_generate_messages_eus agrosim_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agrosim
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(agrosim_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET agrosim_generate_messages_lisp)
  add_dependencies(agrosim_generate_messages_lisp agrosim_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agrosim
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(agrosim_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET agrosim_generate_messages_nodejs)
  add_dependencies(agrosim_generate_messages_nodejs agrosim_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agrosim
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(agrosim_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET agrosim_generate_messages_py)
  add_dependencies(agrosim_generate_messages_py agrosim_generate_messages_py)
endif()
