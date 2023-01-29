extends Node2D

var touch_right = 0
var touch_left = 0
var touch_direction = 0

var player = preload("res://Characters/Player/Player.tscn")



func _physics_process(delta: float) -> void:
	
	
	touch_direction = touch_right - touch_left
