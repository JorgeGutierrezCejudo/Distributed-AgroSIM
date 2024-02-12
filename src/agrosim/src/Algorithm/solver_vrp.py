#!/usr/bin/python
# -*- coding: utf-8 -*-

import math
import networkx as nx
import gurobipy as gp


def define_init_graph(input_data):
    
    lines = input_data.split('\n')

    parts = lines[0].split()
    customer_count = int(parts[0])
    customers = range(customer_count)

    vehicle_count = int(parts[1])

    field_graph = nx.DiGraph(customer_count = customer_count, vehicle_count = vehicle_count)
    field_graph.add_nodes_from(customers)


    for l in lines[1:]:

        parts = l.split()

        field_graph.add_edge(int(parts[0]), int(parts[1]), cost = float(parts[2]))
        field_graph.add_edge(int(parts[1]), int(parts[0]), cost = float(parts[2]))

    return field_graph

def complete_graph_shortest_paths(graph):

    # Crear un grafo completo vacío
    complete_graph = nx.DiGraph(customer_count = graph.graph['customer_count'], vehicle_count = graph.graph["vehicle_count"])

    # Calcular el camino más corto entre cada par de nodos en el grafo original
    for source in graph.nodes():
        shortest_paths = nx.shortest_path(graph, source=source, weight='cost')
        for target in shortest_paths:
            if source != target:
                shortest_path = shortest_paths[target]
                cost = nx.path_weight(graph, shortest_path, weight='cost')

                # Agregar el arco con el costo del camino más corto al grafo completo
                complete_graph.add_edge(source, target, cost=cost)

    return complete_graph


def ordenar_aristas(aristas):
    aristas_ordenadas = []

    # Crear un diccionario para almacenar el lado derecho de cada nodo
    diccionario = { u :  v for u, v in aristas}
    # Encontrar el nodo de inicio, que es aquel que no aparece como lado derecho en ninguna otra arista
    inicio = 0

    # Recorrer las aristas en orden, agregando el nodo de inicio y su lado derecho correspondiente
    while  diccionario[inicio] != 0:
        aristas_ordenadas.append((inicio, diccionario[inicio]))
        inicio = diccionario[inicio]
    aristas_ordenadas.append((inicio, diccionario[inicio]))

    return aristas_ordenadas

def mtsp_constraints_gp(N, E, V):
    """ The function return a CPLEX model with the constraint related with th mTSP problem in the graph (N,E) with V vehicles
    Parameters
    ----------
    name : string
        The name of the model
    N : list  
        Set of nodes
    E : list of tuples
        Set of edges
    V : list 
        Set of vehicles
    Returns
    -------
    m
        Docplex model
    x
        Mobility decision variables
    u 
        Order decision variables
    """
    n_N = len(N)
    n_V = len(V)

    d = N[0]  # The depot is the first element
    C = [i for i in N if i != d]

    # Define the model
    m = gp.Model(name="Utilitarian_model")

    # Decision variables
    #idx = gp.tuplelist([(i, j, v) for (i, j) in E for v in V])
    #x = m.addVars(idx, name="x",vtype =GRB.BINARY,)
    #x = m.addVars(N,N,V, name="x",vtype =GRB.BINARY,) Buenisimo
    x = m.addVars(E,V, name="x",vtype = gp.GRB.BINARY,)

    #idu = [i for i in C]
    u = m.addVars(C, lb=1, ub=(n_N-n_V), name="u")

    # Constraints
    # constraint #1: Visit of the customers
    m.addConstrs((gp.quicksum(x[i, j, v] for v in V for i in N if (i, j) in E) == 1
                    for j in C), name="visit_customers")

    # constraint #2: Flow constraint
    m.addConstrs((gp.quicksum(x[i, j, v] for i in N if (i, j) in E)
                    == gp.quicksum(x[j, i, v] for i in N if (j, i) in E)
                    for j in N for v in V), name="flow_constraints")

    # constraint #3: Is mandatory to leave the depot
    m.addConstrs((gp.quicksum(x[d, j, v] for j in N if (d, j) in E and d != j) == 1
                    for v in V), name="leave_depot")

    # constraint #4: MTZ-Formulation
    m.addConstrs((u[j] - u[i] >= 1 - (n_N-n_V)*(1-gp.quicksum(x[i, j, v] for v in V))
                    for i in C for j in C if (i, j) in E), name="MTZ-Formulation")

    # --------------- AUX CONSTRAINT -----------------------
    # Anadir para acelerar el modelo

    # --------------- KPI -------------------------------
    # Anadir kpi para anizar cosas

    return m, x, u

def vrp_util_gp(complete_graph):

    N  = list(complete_graph.nodes)
    E  = list(complete_graph.edges)
    V  = range(complete_graph.graph["vehicle_count"])
    cost_edges = { e : complete_graph.edges[e]["cost"] for e in E}

    m, x, u = mtsp_constraints_gp(N, E, V)

    cost_route = gp.quicksum( cost_edges[i, j] * x[i, j, v] for (i, j) in E
                       for v in V)
    m.setObjective(cost_route, gp.GRB.MINIMIZE)

    return m, x, u

def solve_vrp(input_data):

    field_graph = define_init_graph(input_data)
    complete_graph = complete_graph_shortest_paths(field_graph)

    vehicle_count = complete_graph.graph["vehicle_count"]

    m,x,u = vrp_util_gp(complete_graph)

    # Solve
    m.Params.LogToConsole = 0
    m.setParam('MIPGap', 0.01)
    m.setParam("TimeLimit", 3600)
    m.optimize()

    solution = { v: ordenar_aristas([ (i,j)  for (i,j) in complete_graph.edges if x[i,j,v].x > 0.1])  for v in range(vehicle_count)}
    obj = m.objVal

    # prepare the solution in the specified output format
    outputData = '%.2f' % obj + ' ' + str(0) + '\n'
    for v in range(vehicle_count):
        outputData +=  ' '.join([str(i) for i,j in solution[v]]) + '\n'
    
    return outputData


import sys

if __name__ == '__main__':
    import sys
    if len(sys.argv) > 0:
        file_location = "GrafoCostInfo.txt"
        with open(file_location, 'r') as input_data_file:
            input_data = input_data_file.read()
        print(solve_vrp(input_data))
    else:

        print('This test requires an input file.  Please select one from the data directory. (i.e. python solver.py ./data/vrp_5_4_1)')

