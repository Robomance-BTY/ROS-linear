import RPi.GPIO as GPIO
import time 
GPIO.cleanup()

ENA = 7
DIR_A= 15
DIR_B = 19

GPIO.setmode(GPIO.BOARD)

GPIO.setup(ENA, GPIO.OUT)
GPIO.setup(DIR_A, GPIO.OUT)
GPIO.setup(DIR_B, GPIO.OUT)
GPIO.output(DIR_A, GPIO.HIGH)
GPIO.output(DIR_B, GPIO.LOW)
try:
    while True:
        # GPIO.output(ENA, GPIO.HIGH)
        # time.sleep(0.005)
        # GPIO.output(ENA, GPIO.LOW)
        # time.sleep(0.005)
        print(hi)
       

except KeyboardInterrupt:
	print("cleanup")
	GPIO.cleanup()

finally:
	GPIO.cleanup()


