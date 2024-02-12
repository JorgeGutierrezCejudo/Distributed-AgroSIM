#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import time
import actionlib
from math import sqrt
import rospy 


from std_msgs.msg import Int64MultiArray
from move_base_msgs.msg import MoveBaseAction

from Inputs import Robot_information,Task_information
from ConflictResolution import ConflictResolution as Con
from Algorithm import Algorithm1 as Al
from ROS import Command as Cmd
from ROS import Comunication as Com

#Variable of the change of state
Not_asignate=True
Doing_task=False
AreNeigbour=False
End=False
Wait_time=0
Waiting=5


#Information variables of the robot and task
Robot= {}
Task={}
ExternalRobot={}
Number_task = 0

#Comunication variable
map="orchad"
ComunicationRange=10
number_robots=4
Experiment=1

def Finish ():
    global Number_task,Not_asignate,End,Doing_task,Task
    Doing_task=False
    Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]=3
    print(Task)
    for i in range (Number_task):
        if Task["Task "+str(i)]["State"]==0:
            Not_asignate=True
            Robot["My"]["State"]==1
            del Robot["My"]["Task Allocated"]
            del Robot["My"]["Cost"]
            End=False
            return
        else:
            End=True

    print("Finish:",End)



def Alocation(Robot,Task,Number_task):
    global Not_asignate,Wait_time
    Al.Initialization(Robot,Task,Number_task)
    
    Robot["My"]["State"]=1
    Not_asignate=False
    Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]=1


def Neigbour(msg):
    global Doing_task,Not_asignate,Robot

    if Doing_task==True:
        pass
    elif Not_asignate==True:
        print("Message recived, but I am not allocated")
    else:
        XDistance=abs(int(Robot["My"]["X"])-msg. data[1])
        YDistance=abs(int(Robot["My"]["Y"])-msg.data[2])
        Distances= sqrt((XDistance*XDistance)+(YDistance*YDistance))
        if msg.data[0]== Robot["My"]["Id"]:
            Not_asignate=False # Discard my message
        else:
            if Distances<ComunicationRange:
                Conflict,Repeted=Com.ComputeInformationOfNeibour(msg,ExternalRobot,Robot) #Process the information
                if Repeted == False:
                    if Conflict==True:
                        Not_asignate=Con.FirstConflictResolution(ExternalRobot,Robot,msg)
                        if Not_asignate==True:
                            Task["Task "+str(ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"])]["State"]=2
                        return 
                    else:
                        print("Comunication with",ExternalRobot["Robot "+str(msg.data[0])]["Id"],"; It is going to task ",ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"],".Without any problem")
                        
                        if Task["Task "+str(ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"])]["State"]<2:
                            Task["Task "+str(ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"])]["State"]=2
                        if len(msg.data)>4:
                            for j in range (5,len(msg.data),3):
                                if msg.data[j]!=Robot["My"]["Id"]:
                                    Task["Task "+str(msg.data[j+1])]["State"]=msg.data[j+2]
                        if Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]>1:
                                 print("Someone have done or are allocated to my task")
                                 Finish()
                                 return                    


def Perception(Action):
    global Waiting,Robot,Doing_task,Not_asignate,Number_task
    Wait_time=0
    a=False
    pub =rospy.Publisher("Comunication",Int64MultiArray,queue_size=100)
    sub=rospy.Subscriber("Comunication",Int64MultiArray,Neigbour)

    if Robot["My"]["State"]==1:
        while (a==False) :
            Com.SayInformation(pub,Robot,ExternalRobot,Task,Number_task)
            time.sleep(1)
            Wait_time=Wait_time+1
            a=(Not_asignate==True) | (Wait_time>Waiting)
    
    elif Robot["My"]["State"]==2:
        Cmd.UpdateMyPosition(Robot["My"]["Id"],Robot)
        Waiting=2
        while (a==False) :
            Com.SayInformation(pub,Robot,ExternalRobot,Task,Number_task)
            Wait_time+=1
            Status=Action.get_state()
            if Status==3:
                Doing_task=True
            a=(Doing_task==True) | (Wait_time>Waiting) | (Not_asignate==True)
            time.sleep(1)

    elif Robot["My"]["State"]==3:  
        Cmd.UpdateMyPosition(Robot["My"]["Id"],Robot)
        Waiting=2
        while (a==False) :
            Com.SayInformation(pub,Robot,ExternalRobot,Task,Number_task)
            Status=Action.get_state()
            if Status==3:
                a=True
            time.sleep(1)
    
    sub.unregister()
    pub.unregister()
    

def TaskPerforming(map):
    print("Robot performing the task")
    y=Task["Task "+str(Robot["My"]["Task Allocated"])]["Y"]
    TaskDoing=actionlib.SimpleActionClient("robot_"+str(Robot["My"]["Id"])+"/move_base",MoveBaseAction)
    TaskDoing.wait_for_server(rospy.Duration(20))
    path="/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/maps/"+map+"/Imagens"

    for i in range (3):
        if Task["Task "+str(Robot["My"]["Task Allocated"])]["Type"]==1 :
            y+=7
            z=0.75

        elif Task["Task "+str(Robot["My"]["Task Allocated"])]["Type"]==2:
            y+=-7 
            z=-0.75
        Cmd.Moving(TaskDoing,Task["Task "+str(Robot["My"]["Task Allocated"])]["X"] ,y,z)
        Perception(TaskDoing)
        Cmd.TakePhoto(int(Robot["My"]["Id"]),int(Robot["My"]["Task Allocated"]),i,path)
        time.sleep(1)
    
    
    print("Robot has finished the task")
    
def InitBehaviur():
    #Robot obtein the information of the task and its information
    global Number_task,Not_asignate,Experiment,End,map

    
    cancel=False

    robot_id=int(sys.argv[1])
    #map= sys.argv[2

    ### Get the Path of the input files

    # task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/agrosim/maps/orchad/TaskConfig"+str(Experiment)+".txt"
    # robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/agrosim/maps/vineyard/RobotConfig"+str(Experiment)+".txt"
    task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/maps/"+map+"/TaskConfig.txt"
    robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed-AgroSIM/src/agrosim/maps/"+map+"/RobotConfig.txt"
    
    ##Get the information of the input files:

    Robot_information.get_robot_info(Robot,robot_id, robot_file)
    Number_task=Task_information.get_task_dimension(task_file)
    Task_information.get_task_info(Task, Number_task, task_file)
    


    rospy.init_node("Robot_behaviur_"+str(robot_id),anonymous=True)
    rate = rospy.Rate(1)
    Movement=actionlib.SimpleActionClient("robot_"+str(Robot["My"]["Id"])+"/move_base",MoveBaseAction)
    

    while not rospy.is_shutdown():
        #The robot is  not asignate
        if End==True: 
            if cancel==False:
                Movement.cancel_goal()
                cancel=True
            print("All task is done waiting for instruction")
        else:
            if Not_asignate==True:
                Alocation(Robot,Task,Number_task)
                print("Allocated:"+str(Robot["My"]["Task Allocated"]))
                Perception(Movement)
                #ResultAlocation("/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/Result")
            
            elif Doing_task==False:
                if Robot["My"]["State"]!=2:
                    Robot["My"]["State"]=2
                    print("Allocated without problem")
                    Cmd.Moving(Movement,Task["Task "+str(Robot["My"]["Task Allocated"])]["X"],Task["Task "+str(Robot["My"]["Task Allocated"])]["Y"],0.75)
                # if Robot["My"]["Id"]==0:
                #     ResultAlocation("/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/Result")
                Perception(Movement)

            elif Doing_task==True:
                print("Robot reached the task")
                Robot["My"]["State"]=3
                print("Robot doing the task")
                TaskPerforming(map)
                #MyWord() 
                Finish() 
        rate.sleep()


if __name__ == '__main__':
    InitBehaviur()