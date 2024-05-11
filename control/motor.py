import RPi.GPIO as GPIO
import time 


ENA = 7
DIR_A= 11
DIR_B = 15

GPIO.setmode(GPIO.BOARD)

GPIO.setup(ENA, GPIO.OUT)
GPIO.setup(DIR_A, GPIO.OUT)
GPIO.setup(DIR_B, GPIO.OUT)
GPIO.output(DIR_A, GPIO.HIGH)
GPIO.output(DIR_B, GPIO.LOW)
try:
    while True:
        GPIO.output(ENA , GPIO.HIGH)
  
       

except KeyboardInterrupt:
	print("cleanup")
	GPIO.cleanup()

finally:
	GPIO.cleanup()


