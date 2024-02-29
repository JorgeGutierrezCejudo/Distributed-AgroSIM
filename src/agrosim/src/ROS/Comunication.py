import rospy
import numpy as np
from agrosim.msg import descentralised,centralised,distributed


def SayInformationDescentralised (pub,Robot,ExternalRobot,Task,Number_task):

    msg=descentralised()
    msg.Id=Robot["My"]["Id"]
    msg.pos_x=Robot["My"]["X"]
    msg.pos_y=Robot["My"]["Y"]
    msg.task=Robot["My"]["Task Allocated"]
    msg.cost=Robot["My"]["Cost"]
    msg.others.row=len(ExternalRobot)
    msg.others.column=Number_task
##TASK ALLOCATED
    for j in ExternalRobot.keys():
        msg.others.Id.append(ExternalRobot[j]["Id"])
        msg.others.Task.append(ExternalRobot[j]["Task Allocated"])
        #msg.others.costs.extend((ExternalRobot[j]["Cost"]))
#TASK DONE
    for i in range(Number_task):
        if Task["Task "+str(i)]["State"]>3:  
            msg.taskdone.append(Task["Task "+str(i)]["Id"])

    pub.publish(msg) #Ver en mi alrededor que robot estan vivos y con quien me puedo comunicar si en mi rango de comunicación. 

def SayInformationDistributed(pub,Robot,ExternalRobot,Task,Number_task):

    msg=distributed()
    msg.Id=Robot["My"]["Id"]
    msg.pos_x=Robot["My"]["X"]
    msg.pos_y=Robot["My"]["Y"]

    pub.publish(msg) #Ver en mi alrededor que robot estan vivos y con quien me puedo comunicar si en mi rango de comunicación.

def ComputeInformationOfNeibourDescentralised (msg,ExternalRobot,Robot):
    #Update external robot information
    Repeted=False
    Conflict=False
    stri="Robot "+str(msg.Id)
    if stri in ExternalRobot:
        if (ExternalRobot[stri]["Task Allocated"] == msg.task):
            Repeted=True
            if ExternalRobot[stri]["Task Allocated"]== Robot["My"]["Task Allocated"]:
                Conflict=True
        else:
            ExternalRobot[stri]={"Id":msg.Id,"X":msg.pos_x,"Y":msg.pos_y,"Task Allocated":msg.task,"Cost":msg.cost}
            if ExternalRobot[stri]["Task Allocated"] == Robot["My"]["Task Allocated"]:
                Conflict=True
    else:
        ExternalRobot[stri]={"Id":msg.Id,"X":msg.pos_x,"Y":msg.pos_y,"Task Allocated":msg.task,"Cost":msg.cost}
        if ExternalRobot[stri]["Task Allocated"] == Robot["My"]["Task Allocated"]:
            Conflict=True
    return Conflict,Repeted

def ComputeInformationOfNeibourDistributed(msg,ExternalRobot,Robot):
    #Update external robot information
    Repeted=False
    stri="Robot "+str(msg.Id)
    if stri in ExternalRobot:
        Repeted=True
    else: 
        ExternalRobot[stri]={"Id":msg.Id,"X":msg.pos_x,"Y":msg.pos_y}
    return Repeted



