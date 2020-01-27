cmake_minimum_required(VERSION 2.8.3)
project(mrinfer)

find_package(catkin REQUIRED COMPONENTS 
    rospy 
    cv_bridge
    std_msgs
    sensor_msgs
    message_generation
)

add_message_files(DIRECTORY msg
                  FILES
                  InferResults.msg
                  InferResultsArray.msg)

catkin_python_setup()

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)


catkin_package(
  CATKIN_DEPENDS message_runtime
)

catkin_install_python(PROGRAMS bin/mrinfer
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})


