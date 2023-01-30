extends Node



func time_freeze(scale, length):
	Engine.time_scale = scale
	yield(get_tree().create_timer(length, false), "timeout")
	Engine.time_scale = 1
