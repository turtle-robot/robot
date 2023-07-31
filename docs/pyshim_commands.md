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

### pan

0 = full lock left

90 = straight forward

180 = full lock right

### tilt

0 = full lock down

90 = straight forward

180 = full lock up
