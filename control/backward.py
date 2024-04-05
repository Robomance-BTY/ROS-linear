import RPi.GPIO as GPIO
import time 

DIR = 12
STP = 16
ENA = 22

GPIO.setmode(GPIO.BOARD)

GPIO.setup(DIR, GPIO.OUT)
GPIO.setup(STP, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)

print("GPIO setup")

duration = 1000


GPIO.output(ENA, GPIO.HIGH)
time.sleep(1)
GPIO.output(DIR, GPIO.HIGH)
speed = 0.0005
	

try:
	while True:
		GPIO.output(STP, GPIO.HIGH)
		time.sleep(speed)
		GPIO.output(STP, GPIO.LOW)
		time.sleep(speed)

except KeyboardInterrupt:
	print("cleanup")
	GPIO.cleanup()

finally:
	GPIO.cleanup()


