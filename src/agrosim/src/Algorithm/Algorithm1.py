import math
import ast
from math import sqrt


def Cost_calculation(Task,Robot,Number_task):
    Cost=[] # Primera aproximación coste = distancia a las tareas.
    for i in range(Number_task):
        if Task["Task "+str(i)]["State"]==0:
            XDistance=abs(int(Robot["My"]["X"])-int(Task["Task "+str(i)]["X"]))
            YDistance=abs(int(Robot["My"]["Y"])-int(Task["Task "+str(i)]["Y"]))
            Distance= sqrt((XDistance*XDistance)+(YDistance*YDistance))
            Cost.append(Distance)
        else:
            Cost.append(100000000)
    return Cost

def Alocation (Cost,Robot):
    Distance=1000000
    Task_allocated=0
    for i in range (len(Cost)):
        if Cost[i]<Distance:
            Distance=Cost[i]
            Task_allocated=i
    if Distance == 1000000:
        print("No task to allocated")
    else:
        Robot["My"]["Task Allocated"]=Task_allocated
        Robot["My"]["Cost"]=Distance

    
def Initialization (Robot,Task,Number_task):
    Cost=Cost_calculation(Task,Robot,Number_task)
    Alocation(Cost,Robot)
    
    
if __name__ == "__main__":
    Initialization()




    
