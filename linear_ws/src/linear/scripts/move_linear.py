#!/usr/bin/env python3
#_=-*- coding: utf-8 -*-
import rospy
import RPi.GPIO as GPIO
import time 
from std_msgs.msg import String

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

def callback(data):
	global speed
	book_storage = rospy.get_param("/linear/book_storage")
	if data.data == 'go':
		target_positions = [-3000, 0]
		for pos in target_positions:
			drawing_book(pos, speed)
			time.sleep(1)
	if data.data == 'one':
		drawing_book(book_storage[1], speed)
			

def linear_subscriber():
	rospy.init_node('linear_subscriber', anonymous=True)
	rospy.Subscriber('move', String,callback) 
	rospy.spin()
	
if __name__ == '__main__':
	try:
		set_gpio()
		linear_subscriber()

	except KeyboardInterrupt:
		GPIO.cleanup()

	finally:
		GPIO.cleanup()
	

