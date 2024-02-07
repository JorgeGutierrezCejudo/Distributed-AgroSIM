import ast

Robot={}


def get_Robot_info(Robot,id_robot, robot_file):
    with open(robot_file, 'r') as file:
        for _ in range(id_robot):
            file.readline()
        line = file.readline().split(";")
        try:
            compatibility = ast.literal_eval(line[1])
        except (ValueError, SyntaxError) as e:
            print(f"Error: {e}")
            compatibility = []
        Robot["My"]={"Id":int(line[0]),"Comp":compatibility,"X":int(line[2]),"Y":int(line[3]),"State":int(line[4])}
    
    return Robot




