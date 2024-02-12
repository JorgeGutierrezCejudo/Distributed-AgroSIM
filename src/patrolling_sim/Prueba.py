#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import time
import actionlib
import pandas as pd
from math import sqrt
import numpy as np
import cv2 as cv
import cv_bridge as cvb
import rospy 
import matplotlib.pyplot as plt
from sensor_msgs.msg import Image
from std_msgs.msg import Int64MultiArray
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal
from geometry_msgs.msg import PolygonStamped


class LoadImage(object):
    def __init__(self):
        self.ReadPhoto=rospy.Subscriber("Camera/color/image_raw",Image,self.photo)
        self.bridge_object=cvb.CvBridge()

    def photo (self,data):
        try:
            cv_img=self.bridge_object.imgmsg_to_cv2(data,desired_encoding="bgr8")
        except cvb.CvBridgeError as e:
            print(e)
    
        cv.imshow("Prueba",cv_img)
        cv.waitKey(1)


a=LoadImage()
rospy.init_node("Imagen",anonymous=True)
while not rospy.is_shutdown():
    time.sleep(1)
cv.destroyAllWindows()
