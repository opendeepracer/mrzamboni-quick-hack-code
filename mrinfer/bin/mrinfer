#!/usr/bin/env python3
from __future__ import print_function

import tensorflow as tf 
import roslib
import sys
import rospy
import cv2

import base64
import json
import numpy as np

from std_msgs.msg import String
from sensor_msgs.msg import Image
from mrinfer.msg import InferResultsArray, InferResults
from cv_bridge import CvBridge, CvBridgeError

IMG_WIDTH  = 160
IMG_HEIGHT = 120

class MrInfer:

    def __init__(self,model):

        try:
            # delete the current graph
            tf.reset_default_graph()
            self.sess = tf.compat.v1.Session(config=tf.ConfigProto(allow_soft_placement=True, log_device_placement=True))

            # import the graph from the file
            self.imported_graph = tf.compat.v1.train.import_meta_graph(model+'.meta')
            self.imported_graph.restore(self.sess, model)
        except ImportError:
            print("import error")
        except IOError:
            print("IOERROR")

        self.sessout = self.sess.graph.get_operation_by_name("main_level/agent/main/online/network_1/ppo_head_0/policy")
        self.obs_type = np.dtype((np.uint8,(IMG_HEIGHT,IMG_WIDTH,1)))

        self.mrinfer_sub        = rospy.Subscriber("video_mjpeg",Image,self.infer)
        self.mrinfer_pub_image  = rospy.Publisher("rl_image",Image,queue_size=1)
        self.mrinfer_pub_result = rospy.Publisher("rl_results",InferResultsArray,queue_size=1)
        self.bridge = CvBridge()

    def infer(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Do the magic
        # fix image
        # scale and black and white
        cv_scaled = cv2.resize(cv_image, (IMG_WIDTH,IMG_HEIGHT), interpolation = cv2.INTER_AREA)
        cv_gray =   cv2.cvtColor(cv_scaled, cv2.COLOR_BGR2GRAY)

        try:
            self.mrinfer_pub_image.publish(self.bridge.cv2_to_imgmsg(cv_gray, "mono8"))
        except CvBridgeError as e:
            print(e)

        # into numpy
        observation = np.frombuffer(cv_gray,self.obs_type)
        # run through model 
        out = self.sess.run(self.sessout.outputs[0],
            {"main_level/agent/main/online/network_0/observation/observation:0" : observation})
        
        pv = out[0]
        resultArray = InferResultsArray()
        results = []
        for i in range(0,len(pv)-1):
            result = InferResults()
            result.classProb = pv[i]
            result.classLabel = i 
            results.append(result)
            
        resultArray.results = results
        resultArray.img = self.bridge.cv2_to_imgmsg(cv_gray, "mono8")
        try:
            self.mrinfer_pub_result.publish(resultArray)
        except CvBridgeError as e:
            print(e)

def node():
        
        rospy.init_node('mrinfer', anonymous=True)
        
        mrInfer = MrInfer("/home/mrzamboni/model/model")

        while not rospy.is_shutdown():
            print("starting spinning")
            rospy.spin()
        print("Shutting down")

if __name__ == '__main__':
    node()
