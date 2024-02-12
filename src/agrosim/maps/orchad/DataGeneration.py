import random
import os
robots=4
tasks=4
implements=3
experiment=3

def generate_random_data(num_implements_range, value_range):
    index = 0
    while True:
        num_implements = random.randint(*num_implements_range)
        implements = random.sample(range(num_implements), num_implements)
        yield (
            index,
            implements,
            random.randint(*value_range),
            random.randint(*value_range),
            0
        )
        index += 1

def write_data_to_file(file_path, num_entries, num_implements_range, value_range,spawn_path):
    os.makedirs(spawn_path, exist_ok=True)
    with open(file_path, 'w') as file:
        data_generator = generate_random_data(num_implements_range, value_range)
        for i in range(num_entries):
            data = next(data_generator)
            line = f"{data[0]};{data[1]};{data[2]};{data[3]};{data[4]};\n"
            file.write(line)
            spawner_content = f'''<launch>
  <arg name="x" value="{data[2]}"/>
  <arg name="y" value="{data[3]}"/>
  <arg name="z" value="0.15"/>
  <arg name="yaw" value="{random.uniform(0, 2 * 3.14159)}"/>
  <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" args="-urdf -model robot_{i} -param robot_description -x $(arg x) -y $(arg y) -z $(arg z) -R 0 -P 0 -Y $(arg yaw)"/>
</launch>'''

            spawner_file_path = os.path.join(spawn_path, f"robot_{i}_spawner.xml")
            with open(spawner_file_path, 'w') as spawner_file:
                spawner_file.write(spawner_content)




def generate_random_task_data(num_tasks, num_implements_range, value_range):
    for task_index in range(num_tasks):
        num_implements = random.randint(*num_implements_range)
        implements = random.sample(range(num_implements), num_implements)
        yield (
            task_index,
            implements,
            random.randint(*value_range),
            random.randint(*value_range),
            0,
            random.randint(0, 1)
        )

def write_task_data_to_file(file_path, num_tasks, num_implements_range, value_range):
    with open(file_path, 'w') as file:
        data_generator = generate_random_task_data(num_tasks, num_implements_range, value_range)
        file.write(f"{num_tasks}\n") 
        file.write("\n") # Escribir el número de tareas en la primera línea
        for _ in range(num_tasks):
            data = next(data_generator)
            line = f"{data[0]};{data[1]};{data[2]};{data[3]};{data[4]};{data[5]};\n"
            file.write(line)



if __name__ == "__main__":
    spawn_path="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/params/spawner"
    # robot_path = "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/RobotConfig"+str(experiment)+".txt"
    # task_path="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/TaskConfig"+str(experiment)+".txt"
    robot_path = "/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/RobotConfig.txt"
    task_path="/home/jorgeurjc/WorkSpace/ROS1/Distributed_AgroSIM/src/patrolling_sim/maps/vineyard/TaskConfig.txt"
    num_entries = robots  # Cambia esto al número deseado de entradas
    num_implements_range = (0,implements)  # Cambia esto al rango deseado de implementos
    value_range = (0, 50)  # Cambia esto al rango deseado de valores
    num_tasks = tasks  # Cambia esto al número deseado de tareas
    write_data_to_file(robot_path, num_entries, num_implements_range, value_range,spawn_path)
    print(f"Datos de los robots escritos en {robot_path}")
    write_task_data_to_file(task_path, num_tasks, num_implements_range, value_range)
    print(f"Datos de tareas escritos en {task_path}")
