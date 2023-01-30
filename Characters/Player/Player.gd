extends KinematicBody2D


func _process(delta: float) -> void:
	Signalbus.emit_signal("send_player_node", self)
