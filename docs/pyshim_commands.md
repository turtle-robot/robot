# PyShim Command Reference

## `q`

this is the quit command.
it requires no arguments

## `throttle <left> <right>`

this sets the throttle of the left motor

accepts floats between `-1.0` and `1.0`

## `gimbal <pan> <tilt>`

this sets the position of the gimbal

accepts "angle" (in degrees) values between 0 and 180

0 for pan is full lock left
90 for pan is straight forward
180 for pan is full lock right

0 for tilt is full lock down
90 for tilt is straight forward
180 for tilt is full lock up
