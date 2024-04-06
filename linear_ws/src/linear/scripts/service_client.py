#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
from std_srvs.srv import Trigger

def move_book_client():
    rospy.wait_for_service('move_book_service')
    try:
        move_book = rospy.ServiceProxy('move_book_service', Trigger)
        resp = move_book()
        return resp.success, resp.message
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

if __name__ == "__main__":
    rospy.init_node('move_book_client')
    success, message = move_book_client()
    if success:
        rospy.loginfo("Service call was successful. %s", message)
    else:
        rospy.logwarn("Service call failed. %s", message)