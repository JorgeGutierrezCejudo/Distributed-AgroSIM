import copy as copy
import numpy as np
from gurobipy import *
from gurobipy import GRB

def Model1 (C,K,V):

    #Model definition
    model = Model('MIPAlgorithm-Model1')
    #Set model time limit
    timeLimit = 3600
    model.setParam('TimeLimit', timeLimit)
    model.Params.LogToConsole = 0

    # ------------------------------------ Decision Variables definitions 
    #Decision variables
    x = {(v,k):model.addVar(vtype=GRB.BINARY, name="x_"+ str(v) + "_" + str(k)) 
                    for v in V for k in K }

    #Objective function
    obj = quicksum(C[v][k] * x[v, k] for v in V for k in K) \


    model.setObjective(obj, GRB.MINIMIZE)

    #Constraints 1: at most 1 task for implement-vehicle
    for k in K:
        model.addConstr(quicksum(x[v, k] for v in V) <= 1)

    #Constraints 2: vehicle assignment to depot or task-implement
    for v in V:
        model.addConstr(quicksum(x[v, k] for k in K) == 1)
    #Solving
    model.optimize()
    all_vars = model.getVars()
    values = model.getAttr("X", all_vars)
    names = model.getAttr("VarName", all_vars)
    tot_var = {name: val for name,val in zip(names, values) if val>0}

    return  tot_var


# data = {
#     'Robot 7': {'Id': 7, 'Cost': (10.44030650891055, 37.0, 100000000.0, 37.48332962798263, 12.649110640673518, 39.92492955535426, 18.027756377319946, 42.5440947723653, 21.02379604162864, 44.10215414239989)},
#     'Robot 5': {'Id': 5, 'Cost': (100000000.0, 33.54101966249684, 9.848857801796104, 35.11409973215888, 18.0, 39.11521443121589, 24.186773244895647, 42.638011210655684, 27.16615541441225, 44.598206241955516)},
#     'Robot 4': {'Id': 4, 'Cost': (12.041594578792296, 39.05124837953327, 100000000.0, 39.81205847478876, 15.231546211727817, 42.5440947723653, 20.223748416156685, 45.27692569068709, 23.194827009486403, 46.87216658103186)}
# }
# Robot={}
# Robot["My"]={"Id": 2,"X":10,"Y":20}
# MyCost = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# # Extraer dimensiones de la matriz

# num_tasks = 10
# num_robots = len(data)+1

# # Inicializar matriz con ceros como enteros
# matrix = np.zeros((num_robots, num_tasks), dtype=int)

# # Llenar la matriz con los valores del diccionario en el orden deseado
# for i, robot_name in enumerate(sorted(data.keys(), key=lambda x: int(x.split()[1]))):
#     matrix[i+1, :] = [int(cost) for cost in data[robot_name]['Cost']]
# matrix[0, :] = MyCost
# print(matrix)
# K = range(num_tasks)
# V=range(num_robots)

# MIPAlgorithm_Model1 = Model1(matrix,K,V)
# print(MIPAlgorithm_Model1)
