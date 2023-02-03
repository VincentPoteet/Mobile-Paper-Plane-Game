extends KinematicBody2D


func _ready() -> void:
	#Signalbus.emit_signal("send_player_node", self)
	Signalbus.player = self
