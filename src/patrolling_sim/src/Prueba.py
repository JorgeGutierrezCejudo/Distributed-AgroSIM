import sys
import time
import actionlib
import pandas as pd
from math import sqrt
import numpy as np
import cv2 as cv
import cv_bridge as cvb
import rospy 
import Algorithm_assignation as Al
import Robot_information as Ro
import Task_information as Ta
import ConflictResolution as Con
import matplotlib.pyplot as plt
from sensor_msgs.msg import Image
from std_msgs.msg import Int64MultiArray
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal
from geometry_msgs.msg import PolygonStamped

rospy.init_node("Prueba")
print("Photo")

