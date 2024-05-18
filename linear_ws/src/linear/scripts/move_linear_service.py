#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import RPi.GPIO as GPIO
import time
from linear.srv import MoveLinear, MoveLinearResponse

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

def move_linear(current_position, target_position):
    global DIR, STP, ENA, speed
    steps = target_position - current_position
    direction = GPIO.HIGH if steps > 0 else GPIO.LOW
    steps = abs(steps)
    GPIO.output(DIR, direction)

    for _ in range(steps):
        GPIO.output(STP, GPIO.HIGH)
        time.sleep(speed)
        GPIO.output(STP, GPIO.LOW)
        time.sleep(speed)

    rospy.set_param('/linear/current_position', target_position)

def unknown_command_handler():
    return "unknown_command"

def handle_move_linear(req):
    command = req.command
    book_storage = rospy.get_param("/linear/book_storage")
    current_position = rospy.get_param("/linear/current_position")
    command_handlers = {
        'drawing_book_forward' : lambda: move_linear(current_position,-3000),
		'drawing_book_backward' : lambda: move_linear(current_position, 0),
		'book_storage1' : lambda: move_linear(current_position, book_storage[1]),
		'book_storage2' : lambda: move_linear(current_position, book_storage[2]),
		'book_storage3' : lambda: move_linear(current_position, book_storage[3]),
		'book_storage4' : lambda: move_linear(current_position, book_storage[4]),
		'book_storage5' : lambda: move_linear(current_position, book_storage[5]),
		'book_storage6' : lambda: move_linear(current_position, book_storage[6]),
		'book_storage7' : lambda: move_linear(current_position, book_storage[7]),
		'book_storage8' : lambda: move_linear(current_position, book_storage[8]),
		'book_storage9' : lambda: move_linear(current_position, book_storage[9]),
		'book_storage10' : lambda: move_linear(current_position, book_storage[10]),
        'reset' : lambda: move_linear(current_position, book_storage[0])
    }
    try:
        response_message = command_handlers.get(command, unknown_command_handler)()
        return MoveLinearResponse(success=True, message=response_message)
    except Exception as e:
        return MoveLinearResponse(success=False, message=str(e))

def linear_service():
    rospy.init_node('linear_service')
    s = rospy.Service('move_linear_service', MoveLinear, handle_move_linear)
    print("Linear service ready.")
    rospy.spin()

if __name__ == '__main__':
    try:
        set_gpio()
        linear_service()
    except rospy.ROSInterruptException:
        pass
    finally:
        GPIO.cleanup()
