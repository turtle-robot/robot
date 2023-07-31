extends Node

const IP_Port = 9000

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	multiplayer.server_relay = false
	
	# autostart server when headless
	if DisplayServer.get_name() == "headless":
		print("Headless mode detected, autostarting as server!")
		_on_host_pressed.call_deferred()

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


func _on_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(IP_Port)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start MP Server")
		return
	multiplayer.multiplayer_peer = peer
	start_game()

func _on_connect_pressed():
	var txt: String = $MPUI/VBoxContainer/HBoxContainer/LineEdit.text
	if txt == "":
		OS.alert("Need IP addr")
		return
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(txt, IP_Port)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start MP Client")
		return
	multiplayer.multiplayer_peer = peer
	start_game()

func start_game():
	$MPUI.hide()
	get_tree().paused = false
