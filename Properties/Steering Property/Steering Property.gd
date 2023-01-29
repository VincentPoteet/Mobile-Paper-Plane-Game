extends Node2D

export var max_steer_speed = 3
export var steer_acceleration = 13
export var steer_deceleration = 10

var steer_speed = 0
var steer_direction = 0

func _process(delta: float) -> void:
	steer_direction = Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")
	
	if steer_direction != 0:
		steer_speed = clamp(steer_speed + (steer_acceleration * steer_direction) * delta, -max_steer_speed, max_steer_speed)
	else:
		steer_speed = Vector2(steer_speed, 0).move_toward(Vector2.ZERO, steer_deceleration * delta).x
	owner.rotation += steer_speed * delta
