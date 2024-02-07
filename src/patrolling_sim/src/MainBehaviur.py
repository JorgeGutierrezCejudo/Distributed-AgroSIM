#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import time
import actionlib
import pandas as pd
from math import sqrt
import numpy as np
import rospy 
import Algorithm_assignation as Al
import Robot_information as Ro
import Task_information as Ta
import ConflictResolution as Con
import matplotlib.pyplot as plt
from std_msgs.msg import Int64MultiArray
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal
from geometry_msgs.msg import PolygonStamped

#Variable of the change of state
Not_asignate=True
Doing_task=False
AreNeigbour=False
End=False
Wait_time=0
Waiting=20


#Information variables of the robot and task

Robot= {}
Task={}
ExternalRobot={}
Number_task = 0



#Comunication variable
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


def Get_robot_position(Robot,id_robot, robot_file):
    Robot=Ro.get_Robot_info(Robot,id_robot,robot_file)


def Get_task_position(Task, Number_task, task_file):
    Number_task=Ta.get_task_dimension(task_file)
    Task=Ta.get_task_info(Task, Number_task, task_file)

    return Number_task

def Neigbour(msg):
    global Doing_task,Not_asignate,Robot
    Distances=100
    if Doing_task==True:
        print("Message recived, but I am doing a task")
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
                Conflict,Repeted=ComputeInformationOfNeibour(msg,ExternalRobot,Robot) #Process the information
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
                                 print(Task)
                                 Finish()
                                 return                    

def ComputeInformationOfNeibour (msg,ExternalRobot,Robot):
    global Not_asignate
    #Update external robot information
    Repeted=False
    Conflict=False
    stri="Robot "+str(msg.data[0]) 
    if stri in ExternalRobot:
        if (ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"] == msg.data[3]):
            Repeted=True
            if ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"] == Robot["My"]["Task Allocated"]:
                Conflict=True
        else:
            ExternalRobot["Robot "+str(msg.data[0])]={"Id":msg.data[0],"X":msg.data[1],"Y":msg.data[2],"Task Allocated":msg.data[3],"Cost":msg.data[4]}
            if ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"] == Robot["My"]["Task Allocated"]:
                Conflict=True
    else:
        ExternalRobot["Robot "+str(msg.data[0])]={"Id":msg.data[0],"X":msg.data[1],"Y":msg.data[2],"Task Allocated":msg.data[3],"Cost":msg.data[4]}
        if ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"] == Robot["My"]["Task Allocated"]:
            Conflict=True
    return Conflict,Repeted

def UpdateMyPosition(msg):
    Robot["My"]["X"]=int(msg.polygon.points[0].x)
    Robot["My"]["Y"]=int(msg.polygon.points[0].y)
    

def Perception(Movement):
    global Waiting,Robot,Doing_task,Not_asignate
    Wait_time=0
    a=False
    pub =rospy.Publisher("Comunication",Int64MultiArray,queue_size=100)
    sub=rospy.Subscriber("Comunication",Int64MultiArray,Neigbour)
    if Robot["My"]["State"]==1:
        while (a==False) :
            SayInformation(pub)
            time.sleep(1)
            Wait_time=Wait_time+1
            a=(Not_asignate==True) | (Wait_time>Waiting)
    
    elif Robot["My"]["State"]==2:
        subpos=rospy.Subscriber("/robot_"+str(Robot["My"]["Id"])+"/move_base/global_costmap/footprint",PolygonStamped,UpdateMyPosition)
        Waiting=2
        while (a==False) :
            SayInformation(pub)
            time.sleep(1)
            Wait_time=Wait_time+1
            Status=Movement.get_state()
            if Status==3:
                Doing_task=True
            a=(Doing_task==True) | (Wait_time>Waiting) | (Not_asignate==True)
        subpos.unregister()
    

    sub.unregister()
    pub.unregister()

def MyWord():
    xRobot=[]
    yRobot=[]
    xTask=[]
    yTask=[]
    theta = np.linspace( 0 , 2 * np.pi , 150 )
    for i in range (10):
        if "Robot "+str(i) in ExternalRobot:
            xRobot.append(ExternalRobot["Robot "+str(i)]["X"])
            yRobot.append(ExternalRobot["Robot "+str(i)]["Y"])
    
    xRobot.append(Robot["My"]["X"])
    yRobot.append(Robot["My"]["Y"])

    for i in range(Number_task):
        xTask.append(Task["Task "+str(i)]["X"])
        yTask.append(Task["Task "+str(i)]["Y"])
    
    plt.scatter(xRobot,yRobot,marker="X",s=8**2,color="blue",label= "External Robot")
    plt.scatter(Robot["My"]["X"],Robot["My"]["Y"],marker="X",s=10**2,color="red",label="My(Robot "+str(Robot["My"]["Id"])+")")
    plt.scatter(xTask,yTask,label="Task",alpha=0.7)
    plt.scatter(Task["Task "+str(Robot["My"]["Task Allocated"])]["X"],Task["Task "+str(Robot["My"]["Task Allocated"])]["Y"],color="red",label="My task")

    a = Robot["My"]["X"]+ComunicationRange * np.cos( theta )
    b = Robot["My"]["Y"]+ComunicationRange * np.sin( theta )
    plt.plot(a,b,c="r")
    plt.legend(loc = 'upper right')
    plt.title("Robot "+str(str(Robot["My"]["Id"]))+" world")

    plt.show()


def ResultAlocation(file_path):
    global number_robots
    if Robot["My"]["Id"] == 0:
        with open(file_path+".txt", 'w') as file:
            data = {'ID': [], 'Task Allocated': []}
            for i in range(number_robots):
                if 'Robot ' + str(i) in ExternalRobot:
                    line = f"{ExternalRobot['Robot ' + str(i)]['Id']} go to {ExternalRobot['Robot ' + str(i)]['Task Allocated']}\n"
                    file.write(line)
                    data['ID'].append(ExternalRobot['Robot ' + str(i)]['Id'])
                    data['Task Allocated'].append(ExternalRobot['Robot ' + str(i)]['Task Allocated'])
            df = pd.DataFrame(data)
            df.to_csv(file_path+".csv", index=False, sep='\t')



def Moving (Movement):

    Movement.wait_for_server(rospy.Duration(20))
    Goal=MoveBaseGoal()
    Goal.target_pose.header.frame_id = "map"
    Goal.target_pose.header.stamp = rospy.Time.now()
    Goal.target_pose.pose.position.x = Task["Task "+str(Robot["My"]["Task Allocated"])]["X"] 
    Goal.target_pose.pose.position.y= Task["Task "+str(Robot["My"]["Task Allocated"])]["Y"] 
    Goal.target_pose.pose.orientation.w = 1.0

    Movement.send_goal(Goal)


def SayInformation (pub):
    global Number_task
    msg=Int64MultiArray()
    msg.data=[Robot["My"]["Id"],Robot["My"]["X"],Robot["My"]["Y"],Robot["My"]["Task Allocated"],int(Robot["My"]["Cost"])]
#TASK ALLOCATED
    for j in ExternalRobot.keys():
        msg.data.append(ExternalRobot[j]["Id"])
        msg.data.append(ExternalRobot[j]["Task Allocated"])
        msg.data.append(2)
#TASK DONE
    for i in range(Number_task):
        if Task["Task "+str(i)]["State"]>2:  
            msg.data.append(-1)
            msg.data.append(Task["Task "+str(i)]["Id"])
            msg.data.append(Task["Task "+str(i)]["State"])
        
    pub.publish(msg) #Ver en mi alrededor que robot estan vivos y con quien me puedo comunicar si en mi rango de comunicación.
    

def InitBehaviur():
    #Robot obtein the information of the task and its information
    global Number_task,Not_asignate,Experiment,End
    cancel=False
    robot_id=int(sys.argv[1])
    # task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/TaskConfig"+str(Experiment)+".txt"
    # robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/RobotConfig"+str(Experiment)+".txt"
    task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/TaskConfig.txt"
    robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/RobotConfig.txt"
    

    Get_robot_position(Robot,robot_id,robot_file)
    Number_task=Get_task_position(Task, Number_task,task_file)


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
                    Moving(Movement)
                # if Robot["My"]["Id"]==0:
                #     ResultAlocation("/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/Result")
                Perception(Movement)

            elif Doing_task==True:
                print("Robot reached the task")
                print("Robot doing the task")
                time.sleep(3)
                #MyWord() 
                Finish() 
                print(Robot)
                print(ExternalRobot)

        rate.sleep()


if __name__ == '__main__':
    InitBehaviur()