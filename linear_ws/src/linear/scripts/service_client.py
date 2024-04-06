#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
from linear.srv import MoveLinear,MoveLinearResponse

def move_linear_client(command):
    rospy.wait_for_service('move_linear_service')
    try:
        move_linear = rospy.ServiceProxy('move_linear_service', MoveLinear)
        resp = move_linear(command)
        return resp.success, resp.message
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

if __name__ == "__main__":
    rospy.init_node('move_book_client')
    success, message = move_linear_client("book_storage4")
    if success:
        rospy.loginfo("Service call was successful. %s", message)
    else:
        rospy.logwarn("Service call failed. %s", message)
