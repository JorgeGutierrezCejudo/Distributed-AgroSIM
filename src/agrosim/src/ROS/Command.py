import rospy
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal
from sensor_msgs.msg import Image
from geometry_msgs.msg import PolygonStamped
import cv2 as cv
import cv_bridge as cvb



def Moving (Move,x,y,z):

    Move.wait_for_server(rospy.Duration(20))
    Goal=MoveBaseGoal()
    Goal.target_pose.header.frame_id = "map"
    Goal.target_pose.header.stamp = rospy.Time.now()
    Goal.target_pose.pose.position.x = x
    Goal.target_pose.pose.position.y= y
    Goal.target_pose.pose.orientation.w = 1
    Goal.target_pose.pose.orientation.z = z
    Move.send_goal(Goal)

def TakePhoto (id,task,number,path):
    print("Robot taking photo")
    Img=rospy.wait_for_message("robot_"+str(id)+"/camera/image_raw",Image,timeout=10)
    bridge_object=cvb.CvBridge()
    try:
        cv_img=bridge_object.imgmsg_to_cv2(Img,desired_encoding="bgr8")
    except cvb.CvBridgeError as e:
        print(e)
    cv.imwrite(path+"/Photo_"+str(task)+"_"+str(number)+".jpg",cv_img)

def UpdateMyPosition (id,Robot):

    msg=rospy.wait_for_message("/robot_"+str(id)+"/move_base/global_costmap/footprint",PolygonStamped,timeout=10)
    Robot["My"]["X"]=int(msg.polygon.points[0].x)
    Robot["My"]["Y"]=int(msg.polygon.points[0].y)


