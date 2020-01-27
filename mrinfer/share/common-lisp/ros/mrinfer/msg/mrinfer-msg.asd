
(cl:in-package :asdf)

(defsystem "mrinfer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "InferResults" :depends-on ("_package_InferResults"))
    (:file "_package_InferResults" :depends-on ("_package"))
    (:file "InferResultsArray" :depends-on ("_package_InferResultsArray"))
    (:file "_package_InferResultsArray" :depends-on ("_package"))
  ))