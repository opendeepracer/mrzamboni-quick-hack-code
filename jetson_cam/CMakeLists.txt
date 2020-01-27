cmake_minimum_required(VERSION 2.8.3)
project(jetson_cam)

find_package(catkin REQUIRED rospy cv_bridge)

catkin_package()
catkin_python_setup()
catkin_install_python(PROGRAMS bin/jetson_cam
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
