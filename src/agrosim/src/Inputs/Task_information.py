import math
import ast
import os

Number_task = 0
FIRST_VID = 1

Task = {}


def get_task_dimension(task_file):
    global Number_task
    with open(task_file, 'r') as file:
        first_line = file.readline().strip()
        if first_line:
            Number_task = int(first_line)
        else:
            print("Error: The file is empty or the first line is missing.")
    return Number_task


def get_task_info(Task, Number_task, task_file):
    with open(task_file, 'r') as file:
        for _ in range(FIRST_VID+1):
            file.readline()


        for i in range(Number_task):
            line = file.readline().split(";")
            try:
                compatibility = ast.literal_eval(line[1])
            except (ValueError, SyntaxError) as e:
                print(f"Error: {e}")
                compatibility = []
            Task["Task "+str(i)]={"Id":int(line[0]),"Comp":compatibility,"X":float(line[2]),"Y":float(line[3]),"State":int(line[4]),"Type":int(line[5])}
    return Task



    
