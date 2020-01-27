;; Auto-generated. Do not edit!


(when (boundp 'mrinfer::InferResultsArray)
  (if (not (find-package "MRINFER"))
    (make-package "MRINFER"))
  (shadow 'InferResultsArray (find-package "MRINFER")))
(unless (find-package "MRINFER::INFERRESULTSARRAY")
  (make-package "MRINFER::INFERRESULTSARRAY"))

(in-package "ROS")
;;//! \htmlinclude InferResultsArray.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass mrinfer::InferResultsArray
  :super ros::object
  :slots (_results _img ))

(defmethod mrinfer::InferResultsArray
  (:init
   (&key
    ((:results __results) (let (r) (dotimes (i 0) (push (instance mrinfer::InferResults :init) r)) r))
    ((:img __img) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _results __results)
   (setq _img __img)
   self)
  (:results
   (&rest __results)
   (if (keywordp (car __results))
       (send* _results __results)
     (progn
       (if __results (setq _results (car __results)))
       _results)))
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:serialization-length
   ()
   (+
    ;; mrinfer/InferResults[] _results
    (apply #'+ (send-all _results :serialization-length)) 4
    ;; sensor_msgs/Image _img
    (send _img :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mrinfer/InferResults[] _results
     (write-long (length _results) s)
     (dolist (elem _results)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image _img
       (send _img :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mrinfer/InferResults[] _results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _results (let (r) (dotimes (i n) (push (instance mrinfer::InferResults :init) r)) r))
     (dolist (elem- _results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;;
   self)
  )

(setf (get mrinfer::InferResultsArray :md5sum-) "5ad60674567d635f03223247f4d48371")
(setf (get mrinfer::InferResultsArray :datatype-) "mrinfer/InferResultsArray")
(setf (get mrinfer::InferResultsArray :definition-)
      "InferResults[] results
sensor_msgs/Image img
================================================================================
MSG: mrinfer/InferResults
int32 classLabel
float32 classProb
float32 xMin
float32 yMin
float32 xMax
float32 yMax
================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :mrinfer/InferResultsArray "5ad60674567d635f03223247f4d48371")


