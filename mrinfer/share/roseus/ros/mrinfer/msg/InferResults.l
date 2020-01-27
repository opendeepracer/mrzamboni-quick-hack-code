;; Auto-generated. Do not edit!


(when (boundp 'mrinfer::InferResults)
  (if (not (find-package "MRINFER"))
    (make-package "MRINFER"))
  (shadow 'InferResults (find-package "MRINFER")))
(unless (find-package "MRINFER::INFERRESULTS")
  (make-package "MRINFER::INFERRESULTS"))

(in-package "ROS")
;;//! \htmlinclude InferResults.msg.html


(defclass mrinfer::InferResults
  :super ros::object
  :slots (_classLabel _classProb _xMin _yMin _xMax _yMax ))

(defmethod mrinfer::InferResults
  (:init
   (&key
    ((:classLabel __classLabel) 0)
    ((:classProb __classProb) 0.0)
    ((:xMin __xMin) 0.0)
    ((:yMin __yMin) 0.0)
    ((:xMax __xMax) 0.0)
    ((:yMax __yMax) 0.0)
    )
   (send-super :init)
   (setq _classLabel (round __classLabel))
   (setq _classProb (float __classProb))
   (setq _xMin (float __xMin))
   (setq _yMin (float __yMin))
   (setq _xMax (float __xMax))
   (setq _yMax (float __yMax))
   self)
  (:classLabel
   (&optional __classLabel)
   (if __classLabel (setq _classLabel __classLabel)) _classLabel)
  (:classProb
   (&optional __classProb)
   (if __classProb (setq _classProb __classProb)) _classProb)
  (:xMin
   (&optional __xMin)
   (if __xMin (setq _xMin __xMin)) _xMin)
  (:yMin
   (&optional __yMin)
   (if __yMin (setq _yMin __yMin)) _yMin)
  (:xMax
   (&optional __xMax)
   (if __xMax (setq _xMax __xMax)) _xMax)
  (:yMax
   (&optional __yMax)
   (if __yMax (setq _yMax __yMax)) _yMax)
  (:serialization-length
   ()
   (+
    ;; int32 _classLabel
    4
    ;; float32 _classProb
    4
    ;; float32 _xMin
    4
    ;; float32 _yMin
    4
    ;; float32 _xMax
    4
    ;; float32 _yMax
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _classLabel
       (write-long _classLabel s)
     ;; float32 _classProb
       (sys::poke _classProb (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xMin
       (sys::poke _xMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yMin
       (sys::poke _yMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xMax
       (sys::poke _xMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yMax
       (sys::poke _yMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _classLabel
     (setq _classLabel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _classProb
     (setq _classProb (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xMin
     (setq _xMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yMin
     (setq _yMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xMax
     (setq _xMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yMax
     (setq _yMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mrinfer::InferResults :md5sum-) "1135a834c1577618b60cb2ddd0fff748")
(setf (get mrinfer::InferResults :datatype-) "mrinfer/InferResults")
(setf (get mrinfer::InferResults :definition-)
      "int32 classLabel
float32 classProb
float32 xMin
float32 yMin
float32 xMax
float32 yMax
")



(provide :mrinfer/InferResults "1135a834c1577618b60cb2ddd0fff748")


