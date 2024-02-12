#!/usr/bin/python
# -*- coding: utf-8 -*-


#Here you define the diferent Rules to resolve the conflict   
    
def FirstConflictResolution(ExternalRobot,Robot,msg):
    if ExternalRobot["Robot "+str(msg.data[0])]["Cost"] == Robot["My"]["Cost"]:
        if ExternalRobot["Robot "+str(msg.data[0])]["Id"] < Robot["My"]["Id"]:
            print("Comunication with",ExternalRobot["Robot "+str(msg.data[0])]["Id"],"; It is going to task ",ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"],".I go to the same task, both have the same cost, I am going to re-alocates because my id is higher")
            del Robot["My"]["Task Allocated"]
            del Robot["My"]["Cost"]
            Robot["My"]["State"]=0
            Not_asignate=True
        else:
            print("Comunication with",ExternalRobot["Robot "+str(msg.data[0])]["Id"],"; It is going to task ",ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"],".I go to the same task, both have the same cost, it is going to re-alocates because its id is higher") 
            Not_asignate=False
    elif ExternalRobot["Robot "+str(msg.data[0])]["Cost"] < Robot["My"]["Cost"]:
        print("Comunication with",ExternalRobot["Robot "+str(msg.data[0])]["Id"],"; It is going to task ",ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"],".I go to the same task, but it have a less cost so i am going to re allocate")  
        del Robot["My"]["Task Allocated"]
        del Robot["My"]["Cost"]
        Robot["My"]["State"]=0
        Not_asignate=True
        
    else:
        print("Comunication with",ExternalRobot["Robot "+str(msg.data[0])]["Id"],"; It is going to task ",ExternalRobot["Robot "+str(msg.data[0])]["Task Allocated"],".I go to the same task, but I have a less cost so i continue allocated with my task")  
        Not_asignate=False
    return Not_asignate


