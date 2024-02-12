
import os
numberRobot=2
ComunicationRange=10
map="orchad"

roscore_cmd = 'gnome-terminal -e "bash -c \'roscore\'" &'
os.system(roscore_cmd)
os.system('sleep 3')

gazebo = 'gnome-terminal -e "bash -c \'roslaunch cpr_orchard_gazebo orchard_world.launch\'" &'
os.system(gazebo)
os.system('sleep 3')

gcmd = 'gnome-terminal '
for i in range (0,numberRobot):
    cmd = 'bash -c \'roslaunch warthog_gazebo multi_warthog.launch use_perfect:="true" robotname:="robot_"'+str(i)
    cmd = cmd + "'"
    gcmd = gcmd + ' --tab -e "'+cmd+'" '
gcmd = gcmd +'&'
os.system (gcmd)
os.system('sleep 3')

gcmd = 'gnome-terminal '
for i in range (0,numberRobot):
    cmd = 'bash -c \'roslaunch navigation amcl.launch robotname:="robot_"'+str(i)
    cmd = cmd + "'"
    gcmd = gcmd + ' --tab -e "'+cmd+'" '
gcmd = gcmd +'&'
os.system (gcmd)
os.system('sleep 3')

gcmd = 'gnome-terminal '
for i in range (0,numberRobot):
    cmd = 'bash -c \'/bin/python3 /home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/src/MainBehaviur.py'+' '+str(i)+' '+map
    cmd = cmd + "'"
    gcmd = gcmd + ' --tab -e "'+cmd+'" '
gcmd = gcmd +'&'
os.system (gcmd)

gcmd = 'gnome-terminal '
cmd = 'bash -c \'/bin/python3 /home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/src/SeeAllocationEnviroment.py'+' '+str(numberRobot)+' '+str(ComunicationRange)+' '+map
cmd = cmd + "'"
gcmd = gcmd + ' --tab -e "'+cmd+'" '
gcmd = gcmd +'&'
os.system (gcmd)

os.system('sleep 3')
roscore_cmd = 'gnome-terminal -e "bash -c \'rosrun rviz rviz -d /home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/Distrubution.rviz\'" &'
os.system(roscore_cmd)
os.system('sleep 3')