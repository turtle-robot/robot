extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var drive = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		drive.x += 10.0
		drive.y += 10.0
	if Input.is_action_pressed("ui_down"):
		drive.x -= 10.0
		drive.y -= 10.0
	if Input.is_action_pressed("ui_left"):
		drive.x -= 100.0
		drive.y += 100.0
	if Input.is_action_pressed("ui_right"):
		drive.x += 100.0
		drive.y -= 100.0
	emit_drive.emit(drive)

signal emit_drive(val: Vector2)
signal emit_gibal(val: Vector2)
