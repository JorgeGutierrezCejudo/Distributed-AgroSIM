#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import time
import actionlib
import pandas as pd
from math import sqrt
import numpy as np
import rospy 
import Algorithm_assignation as Al
import Robot_information as Ro
import Task_information as Ta
import ConflictResolution as Con
import matplotlib.pyplot as plt
from std_msgs.msg import Int64MultiArray
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal
from geometry_msgs.msg import PolygonStamped



ExternalRobot={}

ExternalRobot["Robot 0"]={"Id":0,"X":1,"Y":2,"Task Allocated":3,"Cost":4}
ExternalRobot["Robot 1"]={"Id":1,"X":10,"Y":20,"Task Allocated":2,"Cost":6}
ExternalRobot["Robot 2"]={"Id":2,"X":11,"Y":23,"Task Allocated":1,"Cost":2}

for i in ExternalRobot.keys():
    print(ExternalRobot[i]["Id"],ExternalRobot[i]["Task Allocated"])
   