#!/usr/bin/env python3
#_=-*- coding: utf-8 -*-
import rospy
import RPi.GPIO as GPIO
import time 
from std_msgs.msg import String

DIR = 12
STP = 16
ENA = 22

GPIO.setmode(GPIO.BOARD)

GPIO.setup(DIR, GPIO.OUT)
GPIO.setup(STP, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)
GPIO.output(ENA, GPIO.HIGH)


current_position = 0
speed = 0.0005

def move_motor(steps, direction, delay=0.0005):
	GPIO.output(DIR, direction)
	
	for _ in range(steps):
		GPIO.output(STP, GPIO.HIGH)
		time.sleep(delay)
		GPIO.output(STP, GPIO.LOW)
		time.sleep(delay)

def drawing_book(target_position, speed):
	global current_position
	global DIR, STP, ENA	
	steps = target_position - current_position
	direction = GPIO.HIGH if steps > 0 else GPIO.LOW
	steps = abs(steps)
	GPIO.output(DIR, direction)

	for _ in range(steps):
		GPIO.output(STP, GPIO.HIGH)
		time.sleep(speed)
		GPIO.output(STP, GPIO.LOW)
		time.sleep(speed)

	current_position = target_position

def callback(data):
	global current_position
	global speed
	if data.data == 'go':
		target_positions = [-3000, 0]
		current_position = 0
		for pos in target_positions:
			drawing_book(pos, speed)
			time.sleep(1)

def linear_subscriber():
	rospy.init_node('linear_subscriber', anonymous=True)
	rospy.Subscriber('move', String,callback) 
	rospy.spin()

if __name__ == '__main__':
	try:
		linear_subscriber()

	except KeyboardInterrupt:
		GPIO.cleanup()

	finally:
		GPIO.cleanup()
	

