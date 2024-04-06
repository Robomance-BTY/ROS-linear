import RPi.GPIO as GPIO
import time 
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('dir', type=str)
parser.add_argument('duration', type=int)

args = parser.parse_args()

DIR = 12
STP = 16
ENA = 22

GPIO.setmode(GPIO.BOARD)

GPIO.setup(DIR, GPIO.OUT)
GPIO.setup(STP, GPIO.OUT)
GPIO.setup(ENA, GPIO.OUT)
steps = 80 * args.duration
print(round(steps))
GPIO.output(ENA, GPIO.HIGH)
time.sleep(1)
if args.dir == 'f':
	GPIO.output(DIR, GPIO.LOW)
else:
	GPIO.output(DIR, GPIO.HIGH)	
try:
	for _ in range(round(steps)):
		GPIO.output(STP, GPIO.HIGH)
		time.sleep(0.0005)
		GPIO.output(STP, GPIO.LOW)
		time.sleep(0.0005)

except KeyboardInterrupt:
	print("cleanup")
	GPIO.cleanup()

finally:
	GPIO.cleanup()


