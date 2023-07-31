#!/usr/bin/env python

'''
Copyright Ciaran Farley 2023
CC-BY-NC-SA
'''

import sys

import time
from adafruit_servokit import ServoKit
from adafruit_motorkit import MotorKit


mk = MotorKit(address=0x60)
sk = ServoKit(address=0x60)

def test_throttle_oob(value):
    if value > 1.0:
        return True
    elif value < -1.0:
        return True
    else:
        return False

def main():
    for line in sys.stdin:
        match line.split(" ")[0]:
            case "q":
                break
            case ("throttle", left, right, ):
                # test if left throttle is out of bounds, break if true
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
            case ("gimbal", pan, tilt):
                sk.servo[0] = pan
                sk.servo[1] = tilt



if __name__ == "__main__":
    main()

