#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import RPi.GPIO as GPIO
import time
from std_msgs.msg import String
from std_srvs.srv import Trigger, TriggerResponse

DIR = 12
STP = 16
ENA = 22
speed = 0.0005

def set_gpio():
    global DIR, STP, ENA
    GPIO.setmode(GPIO.BOARD)

    GPIO.setup(DIR, GPIO.OUT)
    GPIO.setup(STP, GPIO.OUT)
    GPIO.setup(ENA, GPIO.OUT)

    GPIO.output(ENA, GPIO.HIGH)

def drawing_book(target_position, speed):
    global DIR, STP, ENA
    current_position = rospy.get_param("/linear/linear_current_position")
    steps = target_position - current_position
    direction = GPIO.HIGH if steps > 0 else GPIO.LOW
    steps = abs(steps)
    GPIO.output(DIR, direction)

    for _ in range(steps):
        GPIO.output(STP, GPIO.HIGH)
        time.sleep(speed)
        GPIO.output(STP, GPIO.LOW)
        time.sleep(speed)

    rospy.set_param('/linear/linear_current_position', target_position)

def handle_move_book(req):
    global speed
    book_storage = rospy.get_param("/linear/book_storage")
    response_message = "Completed: "
    try:
        target_positions = [-3000, 0]
        for pos in target_positions:
            drawing_book(pos, speed)
            time.sleep(1)
            response_message += f"Moved to position {pos}. "
        # 예시에서는 모든 요청을 'go'로 처리합니다. 필요에 따라 다른 로직을 추가할 수 있습니다.
        return TriggerResponse(success=True, message=response_message)
    except Exception as e:
        return TriggerResponse(success=False, message=str(e))

def linear_service():
    rospy.init_node('linear_service')
    s = rospy.Service('move_book_service', Trigger, handle_move_book)
    rospy.spin()

if __name__ == '__main__':
    try:
        set_gpio()
        linear_service()
    except KeyboardInterrupt:
        GPIO.cleanup()
    finally:
        GPIO.cleanup()
