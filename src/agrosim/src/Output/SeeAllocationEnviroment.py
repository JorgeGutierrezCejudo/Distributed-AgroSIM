import math
import ast
from math import sqrt
import numpy as np
from Inputs import Task_information as Ta
import matplotlib.pyplot as plt
import sys

Robots={}
Task={}
Experiment=1


def get_Robot_info(NumberOfRobots, robot_file):
    with open(robot_file, 'r') as file:
        for i in range (NumberOfRobots):
            line = file.readline().split(";")
            try:
                compatibility = ast.literal_eval(line[1])
            except (ValueError, SyntaxError) as e:
                print(f"Error: {e}")
                compatibility = []
            
            Robots["Robot "+str(i)]={"Id":int(line[0]),"Comp":compatibility,"X":int(line[2]),"Y":int(line[3]),"State":int(line[4])}
    
    return Robots


def Start(Task,NumberOfRobots,task_file,robot_file,ComunicationRange):

    Number_task=Ta.get_task_dimension(task_file)
    Task=Ta.get_task_info(Task, Number_task, task_file)
    Robots=get_Robot_info(NumberOfRobots,robot_file)
    colors = ["r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black","r","b","green","pink","yellow","orange","purple","black"]
    theta = np.linspace( 0 , 2 * np.pi , 150 )
    radius = ComunicationRange
    xTask=[]
    yTask=[]

    for i in range (NumberOfRobots):
        xRobot=Robots["Robot "+str(i)]["X"]
        yRobot=Robots["Robot "+str(i)]["Y"]
        plt.scatter(xRobot,yRobot,marker="X",s=10**2,c=colors[i],label="Robot " + str(i))
        a = xRobot+radius * np.cos( theta )
        b = yRobot+radius * np.sin( theta )
        plt.plot(a,b,c=colors[i])

    for i in range(Number_task):
        xTask.append(Task["Task "+str(i)]["X"])
        yTask.append(Task["Task "+str(i)]["Y"])
    plt.scatter(xTask,yTask,label="Task",alpha=0.7)
        

    # for i in range(Number_task):
    #     xTask=Task["Task "+str(i)]["X"]
    #     yTask=Task["Task "+str(i)]["Y"]
    #     plt.scatter(xTask,yTask,label="Task " + str(i),alpha=0.8)
        
    
    plt.title("Allocation Problem")
    plt.legend(loc = 'upper right')

    plt.show()


if __name__ == "__main__":
    # task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/TaskConfig"+str(Experiment)+".txt"
    # robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/RobotConfig"+str(Experiment)+".txt"
    NumberOfRobots=int(sys.argv[1])
    ComunicationRange=int(sys.argv[2])
    map=sys.argv[3]

    task_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/"+str(map)+"/TaskConfig.txt"
    robot_file="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/"+str(map)+"/RobotConfig.txt"
    Start(Task,NumberOfRobots,task_file,robot_file,ComunicationRange)




    
