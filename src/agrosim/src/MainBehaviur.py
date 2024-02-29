#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import time
import actionlib
from math import sqrt
import numpy as np
import rospy 
from queue import SimpleQueue

from agrosim.msg import descentralised,centralised,distributed
from agrosim.srv import *
from move_base_msgs.msg import MoveBaseAction

from Inputs import Robot_information,Task_information
from ConflictResolution import ConflictResolution as Con
from Algorithm import Algorithm1 as Al , MIPAlgorithm as MIP
from ROS import Command as Cmd
from ROS import Comunication as Com

#Variable of the change of state
Not_asignate=True
Doing_task=False
AreNeigbour=False
End=False
WaitForCoordination=False
Wait_time=0
Waiting=10
GlobalCost={}

MsgQueue=SimpleQueue()


#Information variables of the robot and tasks
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


def NeigbourDescentralised(msg):
    global Doing_task,Not_asignate,Robot
    if Doing_task==True:
        pass
    elif Not_asignate==True:
        pass
    else:
        XDistance=abs(int(Robot["My"]["X"])-msg.pos_x)
        YDistance=abs(int(Robot["My"]["Y"])-msg.pos_y)
        Distances= sqrt((XDistance*XDistance)+(YDistance*YDistance))
        if msg.Id== Robot["My"]["Id"]:
            Not_asignate=False # Discard my message
        else:
            if Distances<ComunicationRange:
                MsgQueue.put(msg)

def NeigbourDistributed(msg):
    global Doing_task,Not_asignate,Robot
    if Doing_task==True:
        pass
    elif Not_asignate==True:
        pass
    else:
        XDistance=abs(int(Robot["My"]["X"])-msg.pos_x)
        YDistance=abs(int(Robot["My"]["Y"])-msg.pos_y)
        Distances= sqrt((XDistance*XDistance)+(YDistance*YDistance))
        if msg.Id== Robot["My"]["Id"]:
            Not_asignate=False # Discard my message
        else:
            if Distances<ComunicationRange:
                print("Message in the queue")
                MsgQueue.put(msg)

def DataProcessingDescentralised():
    global Not_asignate

    msg=MsgQueue.get()

    stri="Robot "+str(msg.Id)
    Conflict,Repeted=Com.ComputeInformationOfNeibourDescentralised(msg,ExternalRobot,Robot) #Process the information
    
    if Repeted == False:
        if Conflict==True:
            Not_asignate=Con.FirstConflictResolution(ExternalRobot,Robot,msg)
            if Not_asignate==True:
                Task["Task "+str(ExternalRobot[stri]["Task Allocated"])]["State"]=2
            return 
        
        else:
            print("Comunication with",stri,"; It is going to task ",ExternalRobot[stri]["Task Allocated"],".Without any problem")
            if Task["Task "+str(ExternalRobot[stri]["Task Allocated"])]["State"]<2:
                Task["Task "+str(ExternalRobot[stri]["Task Allocated"])]["State"]=2

        if msg.others:
            for j in range(len(msg.others.Task)):
                if (msg.others.Id[j]!=Robot["My"]["Id"]):
                    Task["Task "+str(msg.others.Task[j])]["State"]=2
                else:
                    print("my task")
                    
    # if msg.taskdone:
    #     for i in range (len(msg.taskdone)):
    #         Task["Task "+str(msg.taskdone[i])]["State"]=4          
    # if Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]>1:
    #     print("Someone have done or are allocated to my task")
    #             Finish()
    #             return   

def DataProcessingDistributed():
    msg=MsgQueue.get()
    Repeted=Com.ComputeInformationOfNeibourDistributed(msg,ExternalRobot,Robot) #Process the information
    

def SendCost(req):
    Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]=0
    cost=Al.Cost_calculation(Task,Robot,Number_task)
    resp=CostResponse()
    resp.Id=Robot["My"]["Id"]
    resp.Cost=cost
    print(cost)
    return resp

def GetCostInformation():
    global GlobalCost
    for i in ExternalRobot:
        print("Getting cost of robot",ExternalRobot[i]["Id"])
        rospy.wait_for_service("robot_"+str(ExternalRobot[i]["Id"])+"/GetCost",10)
        try:
            srvclient=rospy.ServiceProxy("robot_"+str(ExternalRobot[i]["Id"])+"/GetCost",Cost)
            Costs=srvclient(Robot["My"]["Id"])
            GlobalCost["Robot "+str(ExternalRobot[i]["Id"])]={"Id":Costs.Id,"Cost":Costs.Cost}
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

    num_robots = len(GlobalCost)+1
    C = np.zeros((num_robots, Number_task), dtype=int)
    for i, robot_name in enumerate(sorted(GlobalCost.keys(), key=lambda x: int(x.split()[1]))):
        C[i+1, :] = [int(cost) for cost in GlobalCost[robot_name]['Cost']]
    
    Task["Task "+str(Robot["My"]["Task Allocated"])]["State"]=0
    C[0,:]=Al.Cost_calculation(Task,Robot,Number_task)
    return C

def RecivedDecision(req):
    global Robot,ExternalRobot,WaitForCoordination

    for i in req.Ids:
        if i==Robot["My"]["Id"]:
            Robot["My"]["Task Allocated"]=req.Task[i]
            print("I have been assigned task", req.Task[i])
        else:
            stri="Robot "+str(req.Ids[i])
            if stri in ExternalRobot:
                ExternalRobot[stri]["Task Allocated"]=req.Task[i]
                print("Robot", req.Ids[i], "has been assigned task", req.Task[i])
            else:
                ExternalRobot[stri]={"Id":req.Ids[i],"Task Allocated":req.Task[i]}
                print("Robot", req.Ids[i], "has been assigned task", req.Task[i])
    WaitForCoordination=False
    
    return DecisionResponse(True)



def SendDecision(Id,Ids,Taks):
    rospy.wait_for_service("robot_"+str(Id)+"/Decision",10)
    try:
        srvclient=rospy.ServiceProxy("robot_"+str(Id)+"/Decision",Decision)
        Resp=srvclient(Ids,Taks)
        while Resp.Verification==False:
            print("Waiting for the response")
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)


def DecisionComunication(Asignation,ExternalRobot):
    global Robot
    robot_sorted_indices = [Robot['My']["Id"]]
    for ExternalRobot in sorted(ExternalRobot.values(), key=lambda x: x['Id']):
        data_id = ExternalRobot['Id']
        robot_sorted_indices.append(data_id)

    robot_index_mapping = {i: robot_sorted_indices[i] for i in range(len(robot_sorted_indices))}

    # Task assignment process to robots
    task_assignment = {}
    for assignment, value in Asignation.items():
        _, robot_idx, task_idx = assignment.split('_')
        sorted_robot_index = robot_index_mapping[int(robot_idx)]
        updated_assignment = f'x_{sorted_robot_index}_{task_idx}'
        task_assignment[updated_assignment] = value
    
    Ids=[]
    Task=[]

    for assignment, value in task_assignment.items():
        _, robot_idx, task_idx = assignment.split('_')

        Ids.append(int(robot_idx))
        Task.append(int(task_idx))

    for i in range(len(Ids)):
        if Ids[i] == Robot['My']['Id']:
            Robot['My']['Task Allocated'] = Task[i]
            print("I have been assigned task", Task[i])
        else:
            SendDecision(Ids[i],Ids,Task)
            print("Robot", Ids[i], "has been assigned task", Task[i])

    
def DistributedCoordination(ExternalRobot):
    global WaitForCoordination

    Coordinator=True
    for i in ExternalRobot:
        if ExternalRobot[i]["Id"]>Robot["My"]["Id"]:
            pass
        else:
            Coordinator=False
    
    if Coordinator==True:
        C=GetCostInformation()
        V=range(len(ExternalRobot)+1)
        K=range(Number_task)
        print(C,K,V)
        Asignation=MIP.Model1(C,K,V)
        DecisionComunication(Asignation,ExternalRobot)

    else:
        WaitForCoordination=True
        while WaitForCoordination==True:
            print("Wait for the coordinator")
            time.sleep(2)


def Perception(Action):
    global Waiting,Robot,Doing_task,Not_asignate,Number_task
    Wait_time=0
    a=False
    dis=1
    if dis==1:
        pub=rospy.Publisher("Comunication",distributed,queue_size=100)
        sub=rospy.Subscriber("Comunication",distributed,NeigbourDistributed)
    else:
        pub=rospy.Publisher("Comunication",descentralised,queue_size=100)
        sub=rospy.Subscriber("Comunication",descentralised,NeigbourDescentralised)

    if Robot["My"]["State"]==1:
        while (a==False) : 
            if dis==1:
                Com.SayInformationDistributed(pub,Robot,ExternalRobot,Task,Number_task)
            else:
                Com.SayInformationDescentralised(pub,Robot,ExternalRobot,Task,Number_task)
            while ((not MsgQueue.empty()) and (Not_asignate==False)):
                if dis==1:
                    DataProcessingDistributed()
                else:
                    DataProcessingDescentralised()
            time.sleep(1)
            Wait_time=Wait_time+1
            a=(Not_asignate==True) | (Wait_time>Waiting)
    
    elif Robot["My"]["State"]==2:
        Cmd.UpdateMyPosition(Robot["My"]["Id"],Robot)
        Waiting=2
        dis=10
        while (a==False) :
            if dis==1:
                Com.SayInformationDistributed(pub,Robot,ExternalRobot,Task,Number_task)
            elif dis==10:
                pass
            else:
                Com.SayInformationDescentralised(pub,Robot,ExternalRobot,Task,Number_task)
            Wait_time+=1
            Status=Action.get_state()
            if Status==3:
                Doing_task=True
            a=(Doing_task==True) | (Wait_time>Waiting) | (Not_asignate==True)
            time.sleep(1)

    elif Robot["My"]["State"]==3:  
        Cmd.UpdateMyPosition(Robot["My"]["Id"],Robot)
        Waiting=2
        dis=10
        while (a==False) :
            if dis==1:
                Com.SayInformationDistributed(pub,Robot,ExternalRobot,Task,Number_task)
            elif dis==10:
                pass
            else:
                Com.SayInformationDescentralised(pub,Robot,ExternalRobot,Task,Number_task)
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


    rospy.init_node("Robot_behaviur_"+str(Robot["My"]["Id"]),anonymous=True)

    Costsrvserver = rospy.Service("robot_"+str(Robot["My"]["Id"])+"/GetCost", Cost, SendCost)
    Decisionsrvserver = rospy.Service("robot_"+str(Robot["My"]["Id"])+"/Decision", Decision, RecivedDecision)


    rate = rospy.Rate(1)
    Movement=actionlib.SimpleActionClient("robot_"+str(Robot["My"]["Id"])+"/move_base",MoveBaseAction)
    
    dis=1
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
                if dis==1:
                    DistributedCoordination(ExternalRobot)
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