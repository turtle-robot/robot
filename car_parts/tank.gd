extends VehicleBody3D

var wheels_left = []
var wheels_right = []

# Called when the node enters the scene tree for the first time.
func _ready():
	wheels_left = [
		$"Wheel_L1",
		$"Wheel_L2",
		$"Wheel_L3",
		$"Wheel_L4",
		$"Wheel_L5",
	]
	wheels_right = [
		$"Wheel_R1",
		$"Wheel_R2",
		$"Wheel_R3",
		$"Wheel_R4",
		$"Wheel_R5",
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	var left_throttle = 0.0
	var right_throttle = 0.0
	if Input.is_action_pressed("ui_up"):
		left_throttle += 1
		right_throttle += 1
	elif Input.is_action_pressed("ui_down"):
		left_throttle -= 1
		right_throttle -= 1
	
	if Input.is_action_pressed("ui_right"):
		left_throttle += 10
		right_throttle -= 10
	
	if Input.is_action_pressed("ui_left"):
		left_throttle -= 10
		right_throttle += 10
	
	for wheel in wheels_left:
		wheel.set_engine_force(left_throttle * 10.0)
	
	for wheel in wheels_right:
		wheel.set_engine_force(right_throttle * 10.0)
		
