#!/usr/bin/env python

'''
Copyright Ciaran Farley 2023
CC-BY-NC-SA
'''

import sys

import time
from adafruit_servokit import ServoKit
from adafruit_motorkit import MotorKit
import board
import busio

i2c = busio.I2C(board.SCL, board.SDA)

mk = MotorKit(address=0x60, i2c=i2c)
sk = ServoKit(address=0x60, i2c=i2c, channels=16)

def safe():
     # disable gimbal servos
    sk.servo[0].angle = None
    sk.servo[1].angle = None
    # motor throttle zero
    mk.motor1.throttle = 0
    mk.motor2.throttle = 0

def test_throttle_oob(value):
    if value > 1.0 or value < -1.0:
        return True
    else:
        return False

def main():
    for line in sys.stdin:
        cmd = line.strip().split(" ")
        match cmd:
            case ["q"]:
                # safe the robot
                safe()
                # exit
                break
            case ["throttle", left, right, ]:
                # test if left throttle is out of bounds, break if true
                left = float(left)
                right = float(right)
                if test_throttle_oob(left):
                    sys.stderr.write("LEFT THROTTLE OUT OF BOUNDS")
                    break
                # test if right throttle is out of bounds, break if true
                if test_throttle_oob(right):
                    sys.stderr.write("RIGHT THROTTLE OUT OF BOUNDS")
                    break
                # set motor throttles, Left=1, Right=2
                mk.motor1.throttle = left
                mk.motor2.throttle = right
            case ["gimbal", pan, tilt]:
                sk.servo[0].angle = float(pan)
                sk.servo[1].angle = float(tilt)
            case _:
                pass



if __name__ == "__main__":
    main()

