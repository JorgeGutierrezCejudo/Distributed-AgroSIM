import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


def ResultAlocation(Robot,ExternalRobot,file_path,number_robots):
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

def MyWord(Robot,ExternalRobot,Task,ComunicationRange,Number_task):
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