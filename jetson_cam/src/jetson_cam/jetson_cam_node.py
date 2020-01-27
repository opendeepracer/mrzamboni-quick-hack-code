#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class image_pub:

    def __init__(self):
        self.image_pub = rospy.Publisher("video_mjpeg",Image,queue_size=1)
        self.bridge = CvBridge()

    def gstreamer_pipeline(
        self,
        capture_width=3264,
        capture_height=2464,
        display_width=640,
        display_height=480,
        framerate=21,
        flip_method=0,
    ):  # gst-inspect-1.0 nvarguscamerasrc - now set for 50hz
        return (
            "nvarguscamerasrc wbmode=3 aeantibanding=2 ! "
            "video/x-raw(memory:NVMM), "
            "width=(int)%d, height=(int)%d, "
            "format=(string)NV12, framerate=(fraction)%d/1 ! "
            "nvvidconv flip-method=%d ! "
            "video/x-raw, width=(int)%d, height=(int)%d, format=(string)BGRx ! "
            "videoconvert ! "
            "video/x-raw, format=(string)BGR ! appsink"
            % (
                capture_width,
                capture_height,
                framerate,
                flip_method,
                display_width,
                display_height,
            )
    )


    def publish(self,cv_image):
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

def node(args):
    ip = image_pub()
    rospy.init_node('jetson_cam', anonymous=True)
    rate = rospy.Rate(15)

    cap = cv2.VideoCapture(ip.gstreamer_pipeline(flip_method=0), cv2.CAP_GSTREAMER)

    if cap.isOpened():
        while not rospy.is_shutdown():
            ret_val, img = cap.read()
            ip.publish(img)    
            rate.sleep()
    print("Shutting down")

if __name__ == '__main__':
    node(sys.argv)
