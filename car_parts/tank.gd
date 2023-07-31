extends VehicleBody3D

# The lists of wheels so they can be iterated during
# the process loop.
var wheels_left = []
var wheels_right = []

# Store the commanded drive as a Vec2
# (left, right)
var drive_command = Vector2.ZERO

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
	for wheel in wheels_left:
		wheel.set_engine_force(drive_command.x)
	for wheel in wheels_right:
		wheel.set_engine_force(drive_command.y)

func set_drive_command(val: Vector2):
	drive_command = val

func set_gimbal_command(val: Vector2):
	pass
