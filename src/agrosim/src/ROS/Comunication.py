import rospy
from std_msgs.msg import Int64MultiArray


def SayInformation (pub,Robot,ExternalRobot,Task,Number_task):

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

def ComputeInformationOfNeibour (msg,ExternalRobot,Robot):
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