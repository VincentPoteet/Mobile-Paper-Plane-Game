extends Node2D

var time = 0
var frequency = 5
var magnitude = 100

func _process(delta: float) -> void:
	time += delta
	var movement = cos(time * frequency) * magnitude
	get_parent().global_position.y  = owner.global_position.y + (movement * delta)
