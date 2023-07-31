#!/usr/bin/env python

'''
Copyright Ciaran Farley 2023
CC-BY-NC-SA
'''

import sys

from adafruit_motorkit import MotorKit

kit = MotorKit()

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
                kit.motor1.throttle = left
                kit.motor2.throttle = right



if __name__ == "__main__":
    main()

